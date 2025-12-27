import 'package:dogfydiet/data/models/onboarding_data_model.dart';

abstract class SubscriptionRemoteDataSource {
  Future<bool> submitSubscription(OnboardingDataModel onboardingDataModel);
}

class SubscriptionRemoteDataSourceImpl implements SubscriptionRemoteDataSource {
  @override
  Future<bool> submitSubscription(
    OnboardingDataModel onboardingDataModel,
  ) async {
    await Future.delayed(const Duration(seconds: 3));

    return true;
  }
}
