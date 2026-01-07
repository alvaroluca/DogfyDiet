import 'package:dogfydiet/core/types/repository_error.dart';
import 'package:dogfydiet/core/types/result.dart';
import 'package:dogfydiet/features/onboarding/data/datasources/local_data_source/onboarding_local_data_source.dart';
import 'package:dogfydiet/features/onboarding/data/datasources/remote_data_source/subscription_remote_data_source.dart';
import 'package:dogfydiet/features/onboarding/data/models/onboarding_data_model.dart';
import 'package:dogfydiet/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource onboardingLocalDataSource;
  final SubscriptionRemoteDataSource subscriptionRemoteDataSource;

  OnboardingRepositoryImpl(
    this.onboardingLocalDataSource,
    this.subscriptionRemoteDataSource,
  );

  @override
  Result<OnboardingData> getOnboardingData() {
    try {
      final dataModel = onboardingLocalDataSource.getOnboardingData();
      return Result.success(dataModel.toEntity());
    } on Exception catch (e) {
      return Result.failure(
        error: RepositoryError.unknown(message: e.toString()),
      );
    }
  }

  @override
  Future<Result<bool>> saveOnboardingData(OnboardingData data) async {
    try {
      final model = OnboardingDataModel.fromEntity(data);
      await onboardingLocalDataSource.saveOnboardingData(model);
      return const Result.success(true);
    } on Exception catch (e) {
      return Result.failure(
        error: RepositoryError.unknown(message: e.toString()),
      );
    }
  }

  @override
  Future<Result<bool>> submitSubscription(OnboardingData data) async {
    try {
      final onboardingDataModel = OnboardingDataModel.fromEntity(data);

      final success = await subscriptionRemoteDataSource.submitSubscription(
        onboardingDataModel,
      );
      await onboardingLocalDataSource.clearOnboardingData();

      return Result.success(success);
    } on Exception catch (e) {
      return Result.failure(
        error: RepositoryError.unknown(message: e.toString()),
      );
    }
  }
}
