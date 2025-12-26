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
      default:
        return false;
    }
  }
}
