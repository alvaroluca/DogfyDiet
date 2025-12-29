import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/shared/domain/entities/onboarding_data.dart';

abstract class OnboardingRepository {
  Future<Result<OnboardingData>> getOnboardingData();
  Future<Result<bool>> saveOnboardingData(OnboardingData data);
  Future<Result<bool>> submitSubscription(OnboardingData data);
}
