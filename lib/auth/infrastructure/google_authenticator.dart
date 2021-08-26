import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:note_takey/auth/dormain/auth_failure.dart';
import 'package:note_takey/core/infrastructure/dio_extensions.dart';
import 'package:oauth2/oauth2.dart';

import 'credentials_storage/credentials_storage.dart';

class GoogleAuthenticator {
  final CredentialsStorage _storedCredentials;
  final Dio _dio;

  GoogleAuthenticator(this._storedCredentials, this._dio);

  static final authorizationEndpoint =
      Uri.parse('https://accounts.google.com/o/oauth2/v2/auth');
  static final tokenEndpoint = Uri.parse('https://oauth2.googleapis.com/token');
  static final redirectUrl = Uri.parse('http://localhost:3000/callback');
  static final revockationEndpoint =
      Uri.parse('https://oauth2.googleapis.com/revoke');

  static const String clientId =
      '195613348993-hah0bukvfdcr9lbirsqsg651ica3htq1.apps.googleusercontent.com';
  static const String clientSecrete = 'nt2b_fe_fYiLbeHyedgINlnt';
  static const List<String> scopes = ['email', 'profile'];

  Future<Credentials?> getSignInCredentials() async {
    try {
      final storedCredentials = await _storedCredentials.read();
      if (storedCredentials != null) {
        if (storedCredentials.isExpired && storedCredentials.canRefresh) {
          final failureOrCredentials = await refresh(storedCredentials);
          failureOrCredentials.fold((l) => null, (r) => r);
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
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Unit>> signout() async {
    final token = await _storedCredentials
        .read()
        .then((credentials) => credentials?.accessToken);
    try {
      try {
        _dio.postUri(revockationEndpoint, data: {
          'token': token,
        });
      } on DioError catch (e) {
        if (e.isNoConnectionError) {
          print("No internet connection");
        } else {
          rethrow;
        }
      }

      await _storedCredentials.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Credentials>> refresh(
      Credentials credentials) async {
    try {
      final refreshCredentials = await credentials.refresh(
        identifier: clientId,
        secret: clientSecrete,
      );
      await _storedCredentials.save(refreshCredentials);
      return right(refreshCredentials);
    } on PlatformException {
      return left(const AuthFailure.storage());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server("${e.error}: ${e.description}"));
    } on FormatException {
      return left(const AuthFailure.server());
    }
  }
}
