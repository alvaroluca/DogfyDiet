import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/domain/repositories/onboarding_repository.dart';

class GetOnboardingData {
  final OnboardingRepository repository;

  GetOnboardingData(this.repository);

  Future<Result<OnboardingData>> call() async {
    return await repository.getOnboardingData();
  }
}
