import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:note_takey/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:oauth2/src/credentials.dart';

class SecureCredentialsStorageMobile implements CredentialsStorage {
  final FlutterSecureStorage _storage;

  SecureCredentialsStorageMobile(this._storage);

  static const _key = "oauth_credentials";
  Credentials? _cachedCredentials;
  @override
  Future<Credentials?> read() async {
    if (_cachedCredentials == null) {
      final json = await _storage.read(key: _key);
      try {
        _cachedCredentials = json == null ? null : Credentials.fromJson(json);
      } on FormatException {
        return null;
      }
    }
    return _cachedCredentials;
  }

  @override
  Future<void> save(Credentials credentials) {
    _cachedCredentials = credentials;
    return _storage.write(key: _key, value: credentials.toJson());
  }

  @override
  Future<void> clear() {
    _cachedCredentials = null;
    return _storage.delete(key: _key);
  }
}
