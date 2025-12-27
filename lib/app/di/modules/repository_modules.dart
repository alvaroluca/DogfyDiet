part of '../di.dart';

void _repositoryModulesInit() => getIt
  ..registerLazySingleton<DogBreedRepository>(
    () => DogBreedRepositoryImpl(getIt()),
  )
  ..registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(getIt()),
  )
  ..registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(getIt(), getIt(), getIt()),
  );
