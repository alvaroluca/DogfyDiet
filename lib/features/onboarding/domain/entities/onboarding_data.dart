import 'package:dogfydiet/features/onboarding/domain/entities/activity_level_type.dart';
import 'package:dogfydiet/features/onboarding/domain/entities/food_profile_type.dart';
import 'package:dogfydiet/features/onboarding/domain/entities/weight_shape_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_data.freezed.dart';

@freezed
abstract class OnboardingData with _$OnboardingData {
  const factory OnboardingData({
    int? breedId,
    String? dogName,
    String? gender,
    bool? isSterilized,
    DateTime? birthDate,
    @Default(WeightShapeType.normal) WeightShapeType weightShape,
    double? weightValue,
    @Default(ActivityLevelType.medium) ActivityLevelType activityLevel,
    @Default(false) bool hasPathologies,
    @Default(FoodProfileType.gourmet) FoodProfileType foodProfile,
    String? ownerName,
    String? location,
  }) = _OnboardingData;

  const OnboardingData._();

  bool isStepComplete(int step) {
    switch (step) {
      case 0:
        return breedId != null;
      case 1:
        return dogName != null && dogName!.isNotEmpty;
      case 2:
        return gender != null && gender!.isNotEmpty && isSterilized != null;
      case 3:
        return birthDate?.year != null && birthDate?.month != null;
      case 4:
        return weightValue != null && weightValue! > 0.0;
      case 5:
        return true;
      case 6:
        return true;
      case 7:
        return true;
      case 8:
        return ownerName != null &&
            ownerName!.isNotEmpty &&
            location != null &&
            location!.isNotEmpty;
      default:
        return false;
    }
  }
}
