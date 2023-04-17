import 'package:get_it/get_it.dart';
import 'package:quiz_app/core/service/get_navigation.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => GetNavigation());
}