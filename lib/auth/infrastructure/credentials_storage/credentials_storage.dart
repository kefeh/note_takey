// This class holds the abstract inmplementation that Will
// be implemented both for the web and the mobile credentials
// since they both have different implementations and we dont
// want to have different interfaces for it, but rather one interface
// and different implementations,
import 'package:oauth2/oauth2.dart';

abstract class CredentialsStorage {
  Future<Credentials?> read();
  Future<void> save(Credentials credentials);
  Future<void> clear();
}
