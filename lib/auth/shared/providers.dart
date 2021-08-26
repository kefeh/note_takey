import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_takey/auth/application/auth_state_notifier.dart';
import 'package:note_takey/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:note_takey/auth/infrastructure/credentials_storage/secure_credentials_storage_mobile.dart';
import 'package:note_takey/auth/infrastructure/google_authenticator.dart';

final flutterSecureStorage = Provider((ref) => const FlutterSecureStorage());

final credentialsStorageProvider =
    Provider<CredentialsStorage>((ref) => SecureCredentialsStorageMobile(
          ref.watch(flutterSecureStorage),
        ));

final dioProvider = Provider((ref) => Dio());

final googleAuthenticatorProvider = Provider((ref) => GoogleAuthenticator(
      ref.watch(credentialsStorageProvider),
      ref.watch(dioProvider),
    ));

final authNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>(
        (ref) => AuthStateNotifier(
              ref.watch(googleAuthenticatorProvider),
            ));
