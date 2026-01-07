import 'package:dogfydiet/core/types/result.dart';
import 'package:dogfydiet/features/onboarding/domain/entities/onboarding_data.dart';

abstract class OnboardingRepository {
  Result<OnboardingData> getOnboardingData();
  Future<Result<bool>> saveOnboardingData(OnboardingData data);
  Future<Result<bool>> submitSubscription(OnboardingData data);
}
