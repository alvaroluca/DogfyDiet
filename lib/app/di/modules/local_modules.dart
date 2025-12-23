part of '../di.dart';

void _localModulesInit() => getIt
  ..registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(getIt()),
  );
