import 'package:dogfydiet/domain/entities/activity_level_type.dart';
import 'package:dogfydiet/domain/entities/food_profile_type.dart';
import 'package:dogfydiet/domain/entities/weight_shape_type.dart';
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
  const factory OnboardingEvent.updateWeightShape(WeightShapeType weightShape) =
      UpdateWeightShape;
  const factory OnboardingEvent.updateWeightValue(double value) =
      UpdateWeightValue;
  const factory OnboardingEvent.updateActivityLevel(
    ActivityLevelType activityLevel,
  ) = UpdateActivityLevel;
  const factory OnboardingEvent.updateHasPathologies(bool hasPathologies) =
      UpdateHasPathologies;
  const factory OnboardingEvent.updateFoodProfile(FoodProfileType foodProfile) =
      UpdateFoodProfile;
  const factory OnboardingEvent.updateLocation(String location) =
      UpdateLocation;
  const factory OnboardingEvent.updateOwnerName(String ownerName) =
      UpdateOwnerName;
  const factory OnboardingEvent.fetchLocation() = FetchLocation;
  const factory OnboardingEvent.submitSubscription() = SubmitSubscriptionEvent;
  const factory OnboardingEvent.resetBreed() = ResetBreed;
}
