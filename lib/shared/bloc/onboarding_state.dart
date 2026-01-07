import 'package:dogfydiet/shared/domain/entities/dog_breed.dart';
import 'package:dogfydiet/shared/domain/entities/onboarding_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

enum OnboardingStatus { initial, loading, loaded, submitting, success, error }

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(OnboardingStatus.initial) OnboardingStatus status,
    @Default(OnboardingData()) OnboardingData onboardingData,
    @Default(<DogBreed>[]) List<DogBreed> dogBreeds,
    String? errorMessage,
    @Default(false) bool isLocationLoading,
  }) = _OnboardingState;

  const OnboardingState._();
}
