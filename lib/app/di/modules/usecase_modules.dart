part of '../di.dart';

void _useCaseModulesInit() =>
    getIt..registerLazySingleton(() => GetDogBreeds(getIt()));
