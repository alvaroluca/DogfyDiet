part of '../di.dart';

Future<void> _preferencesModulesInit() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}
