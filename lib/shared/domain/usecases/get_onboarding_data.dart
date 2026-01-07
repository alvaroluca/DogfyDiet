import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/shared/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/shared/domain/repositories/onboarding_repository.dart';

class GetOnboardingData {
  final OnboardingRepository repository;

  GetOnboardingData(this.repository);

  Result<OnboardingData> call() {
    return repository.getOnboardingData();
  }
}
