import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_takey/auth/dormain/auth_failure.dart';
import 'package:note_takey/auth/infrastructure/google_authenticator.dart';
part 'auth_state_notifier.freezed.dart';

typedef AuthUriCallback = Future<Uri> Function(Uri authorieationUrl);

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.failure(AuthFailure failure) = _Failure;
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  final GoogleAuthenticator _authenticator;

  AuthStateNotifier(this._authenticator) : super(const AuthState.initial());

  Future<void> checkAndUpdateAuthStatus() async {
    final isSignedIn = await _authenticator.isSignedIn();
    if (isSignedIn) {
      state = const AuthState.authenticated();
    } else {
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> signIn(AuthUriCallback authorizationCallback) async {
    final grant = _authenticator.createGrant();
    final uri = _authenticator.getAuthorizationUrl(grant);
    final redirectUrl = await authorizationCallback(uri);
    final failureOrSuccess = await _authenticator.handleAuthorizationResponse(
      grant,
      redirectUrl.queryParameters,
    );
    failureOrSuccess.fold(
      (l) => AuthState.failure(l),
      (r) => const AuthState.authenticated(),
    );
    grant.close();
  }

  Future<void> signOut() async {
    final failureOrSuccess = await _authenticator.signout();
    failureOrSuccess.fold(
      (l) => AuthState.failure(l),
      (r) => const AuthState.unauthenticated(),
    );
  }
}
