part of '../di.dart';

void _remoteModulesInit() => getIt
  ..registerLazySingleton<DogBreedRemoteDataSource>(
    () => DogBreedRemoteDataSourceImpl(),
  )
  ..registerLazySingleton<LocationRemoteDataSource>(
    () => LocationRemoteDataSourceImpl(),
  )
  ..registerLazySingleton<SubscriptionRemoteDataSource>(
    () => SubscriptionRemoteDataSourceImpl(),
  );
