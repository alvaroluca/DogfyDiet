part of '../di.dart';

void _uiModulesInit() =>
    getIt.registerFactory(() => OnboardingBloc(getDogBreeds: getIt()));
