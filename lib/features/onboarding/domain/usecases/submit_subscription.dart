import 'package:dogfydiet/core/types/result.dart';
import 'package:dogfydiet/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/features/onboarding/domain/repositories/onboarding_repository.dart';

class SubmitSubscription {
  final OnboardingRepository repository;

  SubmitSubscription(this.repository);

  Future<Result<bool>> call(OnboardingData data) {
    return repository.submitSubscription(data);
  }
}
