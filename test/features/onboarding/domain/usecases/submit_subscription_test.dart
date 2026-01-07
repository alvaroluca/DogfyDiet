import 'package:dogfydiet/core/types/repository_error.dart';
import 'package:dogfydiet/core/types/result.dart';
import 'package:dogfydiet/features/onboarding/domain/entities/activity_level_type.dart';
import 'package:dogfydiet/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/submit_subscription.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOnboardingRepository extends Mock implements OnboardingRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(const OnboardingData());
  });

  late SubmitSubscription submitSubscription;
  late MockOnboardingRepository mockRepository;

  setUp(() {
    mockRepository = MockOnboardingRepository();
    submitSubscription = SubmitSubscription(mockRepository);
  });

  const testData = OnboardingData(
    dogName: 'Buddy',
    ownerName: 'John Doe',
    location: 'Madrid',
    breedId: 1,
    activityLevel: ActivityLevelType.high,
  );

  group('SubmitSubscription UseCase', () {
    test('returns success when repository responds correctly', () async {
      when(
        () => mockRepository.submitSubscription(any()),
      ).thenAnswer((_) async => const Result.success(true));

      final result = await submitSubscription(testData);
      expect(
        result.maybeWhen(success: (data) => data, orElse: () => false),
        true,
      );
    });

    test('returns error when repository fails', () async {
      const error = RepositoryError.unknown(message: 'Submission failed');
      when(
        () => mockRepository.submitSubscription(any()),
      ).thenAnswer((_) async => const Result.failure(error: error));

      final result = await submitSubscription(testData);
      expect(
        result.maybeWhen(failure: (err) => err.message, orElse: () => ''),
        'Submission failed',
      );
    });

    test('returns failure when network error occurs', () async {
      const error = RepositoryError.network(message: 'Network timeout');
      when(
        () => mockRepository.submitSubscription(any()),
      ).thenAnswer((_) async => const Result.failure(error: error));

      final result = await submitSubscription(testData);

      expect(
        result.maybeWhen(
          failure: (err) => (err.message ?? '').contains('Network'),
          orElse: () => false,
        ),
        true,
      );
    });

    test('propagates repository errors to caller', () async {
      const error = RepositoryError.unknown(message: 'Server error');
      when(
        () => mockRepository.submitSubscription(any()),
      ).thenAnswer((_) async => const Result.failure(error: error));

      final result = await submitSubscription(testData);

      expect(
        result.maybeWhen(failure: (err) => err.message, orElse: () => ''),
        'Server error',
      );
      verify(() => mockRepository.submitSubscription(testData)).called(1);
    });
  });
}
