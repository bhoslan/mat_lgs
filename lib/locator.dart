import 'package:get_it/get_it.dart';
import 'package:mat_lgs/services/fake_auth_service.dart';
import 'package:mat_lgs/services/firebase_auth_service.dart';

GetIt locator = GetIt.instance;
void setUpLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FakeAuthService());
}
