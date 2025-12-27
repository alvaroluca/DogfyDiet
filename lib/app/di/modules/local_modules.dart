part of '../di.dart';

void _localModulesInit() => getIt
  ..registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(getIt()),
  )
  ..registerLazySingleton<PermissionLocalDataSource>(
    () => PermissionLocalDataSourceImpl(),
  )
  ..registerLazySingleton<GeolocationLocalDataSource>(
    () => GeolocationLocalDataSourceImpl(),
  );
