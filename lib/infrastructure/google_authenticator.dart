import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:note_takey/dormain/auth_failure.dart';
import 'package:note_takey/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:oauth2/oauth2.dart';

class GoogleAuthenticator {
  final CredentialsStorage _storedCredentials;

  GoogleAuthenticator(this._storedCredentials);

  static final authorizationEndpoint =
      Uri.parse('https://accounts.google.com/o/oauth2/v2/auth');
  static final tokenEndpoint = Uri.parse('https://oauth2.googleapis.com/token');
  static final redirectUrl = Uri.parse('http://localhost:3000/callback');

  static const String clientId =
      '195613348993-hah0bukvfdcr9lbirsqsg651ica3htq1.apps.googleusercontent.com';
  static const String clientSecrete = 'nt2b_fe_fYiLbeHyedgINlnt';
  static const List<String> scopes = ['email', 'profile'];

  Future<Credentials?> getSignInCredentials() async {
    try {
      final storedCredentials = await _storedCredentials.read();
      if (storedCredentials != null) {
        if (storedCredentials.isExpired && storedCredentials.canRefresh) {
          //TODO: referesh the token;
        }
        return storedCredentials;
      }
    } on PlatformException {
      return null;
    }
  }

  Future<bool> isSignedIn() =>
      getSignInCredentials().then((credentials) => credentials != null);

  AuthorizationCodeGrant createGrant() {
    return AuthorizationCodeGrant(
      clientId,
      authorizationEndpoint,
      tokenEndpoint,
      secret: clientSecrete,
    );
  }

  Uri getAuthorizationUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirectUrl, scopes: scopes);
  }

  Future<Either<AuthFailure, Unit>> handleAuthorizationResponse(
    AuthorizationCodeGrant grant,
    Map<String, String> params,
  ) async {
    try {
      final httpClient = await grant.handleAuthorizationResponse(params);
      await _storedCredentials.save(httpClient.credentials);
      return right(unit);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.Storage());
    }
  }
}
