import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_event.freezed.dart';

@freezed
class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.loadDogBreeds() = LoadDogBreeds;
  const factory OnboardingEvent.loadOnboardingData() = LoadOnboardingData;
  const factory OnboardingEvent.updateBreed(int breedId) = UpdateBreed;
  const factory OnboardingEvent.updateDogName(String dogName) = UpdateDogName;
  const factory OnboardingEvent.updateGender(String gender) = UpdateGender;
  const factory OnboardingEvent.updateSterilization(bool isSterilized) =
      UpdateSterilization;
  const factory OnboardingEvent.updateBirthDate(DateTime birthDate) =
      UpdateBirthDate;
}
