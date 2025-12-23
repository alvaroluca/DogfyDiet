part of '../di.dart';

void _repositoryModulesInit() => getIt
  ..registerLazySingleton<DogBreedRepository>(
    () => DogBreedRepositoryImpl(getIt()),
  );
