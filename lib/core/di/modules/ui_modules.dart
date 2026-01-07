part of '../di.dart';

void _uiModulesInit() => getIt
  ..registerFactory(
    () => OnboardingBloc(
      getDogBreeds: getIt(),
      getOnboardingData: getIt(),
      saveOnboardingData: getIt(),
      getCurrentLocation: getIt(),
      submitSubscription: getIt(),
    ),
  )
  ..registerFactory(() => DogNameCubit())
  ..registerFactory(() => OnboardingStepCubit())
  ..registerFactory(() => BirthDateCubit())
  ..registerFactory(() => WeightCubit(weight: getIt()))
  ..registerFactory(() => OwnerInfoCubit());
