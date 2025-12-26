import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_data.freezed.dart';

@freezed
abstract class OnboardingData with _$OnboardingData {
  const factory OnboardingData({int? breedId, String? dogName}) =
      _OnboardingData;

  const OnboardingData._();

  bool isStepComplete(int step) {
    switch (step) {
      case 0:
        return breedId != null;
      case 1:
        return dogName != null && dogName!.isNotEmpty;
      default:
        return false;
    }
  }
}
