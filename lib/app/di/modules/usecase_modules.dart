part of '../di.dart';

void _useCaseModulesInit() => getIt
  ..registerLazySingleton(() => GetDogBreeds(getIt()))
  ..registerLazySingleton(() => GetOnboardingData(getIt()))
  ..registerLazySingleton(() => SaveOnboardingData(getIt()))
  ..registerLazySingleton(() => GetCurrentLocation(getIt()))
  ..registerLazySingleton(() => SubmitSubscription(getIt()));
