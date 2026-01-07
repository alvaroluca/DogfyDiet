import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/shared/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/shared/domain/repositories/onboarding_repository.dart';

class SaveOnboardingData {
  final OnboardingRepository repository;

  SaveOnboardingData(this.repository);

  Future<Result<bool>> call(OnboardingData data) {
    return repository.saveOnboardingData(data);
  }
}
