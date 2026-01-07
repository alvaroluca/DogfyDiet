import 'package:dogfydiet/core/types/repository_error.dart';
import 'package:dogfydiet/core/types/result.dart';
import 'package:dogfydiet/features/onboarding/data/datasources/local_data_source/onboarding_local_data_source.dart';
import 'package:dogfydiet/features/onboarding/data/datasources/remote_data_source/subscription_remote_data_source.dart';
import 'package:dogfydiet/features/onboarding/data/models/onboarding_data_model.dart';
import 'package:dogfydiet/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:dogfydiet/features/onboarding/domain/entities/activity_level_type.dart';
import 'package:dogfydiet/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockOnboardingLocalDataSource extends Mock
    implements OnboardingLocalDataSource {}

class _MockSubscriptionRemoteDataSource extends Mock
    implements SubscriptionRemoteDataSource {}

void main() {
  late _MockOnboardingLocalDataSource mockLocalDataSource;
  late _MockSubscriptionRemoteDataSource mockRemoteDataSource;
  late OnboardingRepositoryImpl repository;

  setUpAll(() {
    registerFallbackValue(const OnboardingDataModel());
  });

  setUp(() {
    mockLocalDataSource = _MockOnboardingLocalDataSource();
    mockRemoteDataSource = _MockSubscriptionRemoteDataSource();
    repository = OnboardingRepositoryImpl(
      mockLocalDataSource,
      mockRemoteDataSource,
    );
  });

  const testModel = OnboardingDataModel(
    dogName: 'Buddy',
    ownerName: 'John Doe',
    location: 'Madrid',
    breedId: 1,
    activityLevel: ActivityLevelType.high,
  );
  final testEntity = testModel.toEntity();

  group('OnboardingRepositoryImpl - getOnboardingData', () {
    test('getOnboardingData returns success with data', () {
      when(
        () => mockLocalDataSource.getOnboardingData(),
      ).thenAnswer((_) => testModel);
      final result = repository.getOnboardingData();
      expect(result, isA<Result<OnboardingData>>());
      expect(
        result.when(success: (data) => data.dogName, failure: (error) => null),
        'Buddy',
      );
      verify(() => mockLocalDataSource.getOnboardingData()).called(1);
    });

    test('getOnboardingData returns failure when datasource throws', () {
      when(
        () => mockLocalDataSource.getOnboardingData(),
      ).thenThrow(Exception('Storage error'));
      final result = repository.getOnboardingData();
      expect(result, isA<Result<OnboardingData>>());
      expect(
        result.when(success: (data) => null, failure: (error) => error),
        isA<RepositoryError>(),
      );
    });
  });

  group('OnboardingRepositoryImpl - saveOnboardingData', () {
    test('saveOnboardingData returns success', () async {
      when(() => mockLocalDataSource.saveOnboardingData(any())).thenAnswer((
        _,
      ) async {
        return;
      });
      final result = await repository.saveOnboardingData(testEntity);
      expect(result, isA<Result<bool>>());
      expect(
        result.when(success: (data) => data, failure: (error) => false),
        true,
      );
      verify(() => mockLocalDataSource.saveOnboardingData(any())).called(1);
    });

    test('saveOnboardingData returns failure when datasource throws', () async {
      when(
        () => mockLocalDataSource.saveOnboardingData(any()),
      ).thenThrow(Exception('Save failed'));
      final result = await repository.saveOnboardingData(testEntity);
      expect(result, isA<Result<bool>>());
      expect(
        result.when(success: (data) => null, failure: (error) => error),
        isA<RepositoryError>(),
      );
    });
  });

  group('OnboardingRepositoryImpl - submitSubscription', () {
    test('submitSubscription returns success and clears data', () async {
      when(
        () => mockRemoteDataSource.submitSubscription(any()),
      ).thenAnswer((_) async => true);
      when(() => mockLocalDataSource.clearOnboardingData()).thenAnswer((
        _,
      ) async {
        return;
      });
      final result = await repository.submitSubscription(testEntity);
      expect(result, isA<Result<bool>>());
      expect(
        result.when(success: (data) => data, failure: (error) => false),
        true,
      );
      verify(() => mockRemoteDataSource.submitSubscription(any())).called(1);
      verify(() => mockLocalDataSource.clearOnboardingData()).called(1);
    });

    test(
      'submitSubscription returns failure when remote datasource fails',
      () async {
        when(
          () => mockRemoteDataSource.submitSubscription(any()),
        ).thenThrow(Exception('Network error'));
        final result = await repository.submitSubscription(testEntity);
        expect(result, isA<Result<bool>>());
        expect(
          result.when(success: (data) => null, failure: (error) => error),
          isA<RepositoryError>(),
        );
        verifyNever(() => mockLocalDataSource.clearOnboardingData());
      },
    );

    test('submitSubscription returns failure when local clear fails', () async {
      when(
        () => mockRemoteDataSource.submitSubscription(any()),
      ).thenAnswer((_) async => true);
      when(
        () => mockLocalDataSource.clearOnboardingData(),
      ).thenThrow(Exception('Clear error'));
      final result = await repository.submitSubscription(testEntity);
      expect(result, isA<Result<bool>>());
      expect(
        result.when(success: (data) => null, failure: (error) => error),
        isA<RepositoryError>(),
      );
    });
  });
}
