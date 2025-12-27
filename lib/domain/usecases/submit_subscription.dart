import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/domain/repositories/onboarding_repository.dart';

class SubmitSubscription {
  final OnboardingRepository repository;

  SubmitSubscription(this.repository);

  Future<Result<bool>> call(OnboardingData data) async {
    return await repository.submitSubscription(data);
  }
}
