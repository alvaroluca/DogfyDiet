import 'package:dogfydiet/app/types/repository_error.dart';
import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/domain/entities/activity_level_type.dart';
import 'package:dogfydiet/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/domain/repositories/onboarding_repository.dart';
import 'package:dogfydiet/domain/usecases/save_onboarding_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOnboardingRepository extends Mock implements OnboardingRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(const OnboardingData());
  });

  late SaveOnboardingData saveOnboardingData;
  late MockOnboardingRepository mockRepository;

  setUp(() {
    mockRepository = MockOnboardingRepository();
    saveOnboardingData = SaveOnboardingData(mockRepository);
  });

  group('SaveOnboardingData UseCase', () {
    const testData = OnboardingData(
      dogName: 'Buddy',
      ownerName: 'John Doe',
      location: 'Madrid',
      breedId: 1,
      activityLevel: ActivityLevelType.high,
    );

    test('calls repository.saveOnboardingData with correct data', () async {
      when(
        () => mockRepository.saveOnboardingData(any()),
      ).thenAnswer((_) async => const Result.success(true));

      await saveOnboardingData(testData);

      verify(() => mockRepository.saveOnboardingData(testData)).called(1);
    });

    test('returns success when repository succeeds', () async {
      when(
        () => mockRepository.saveOnboardingData(any()),
      ).thenAnswer((_) async => const Result.success(true));

      final result = await saveOnboardingData(testData);

      expect(result, isA<Result<bool>>());
      expect(
        result.maybeWhen(success: (data) => data, orElse: () => false),
        true,
      );
    });

    test('returns error when repository fails', () async {
      const error = RepositoryError.unknown(message: 'Save failed');
      when(
        () => mockRepository.saveOnboardingData(any()),
      ).thenAnswer((_) async => const Result.failure(error: error));

      final result = await saveOnboardingData(testData);

      expect(result, isA<Result<bool>>());
      expect(
        result.maybeWhen(failure: (error) => error.message, orElse: () => ''),
        'Save failed',
      );
    });

    test('propagates repository errors to caller', () async {
      const error = RepositoryError.network(message: 'Network error');
      when(
        () => mockRepository.saveOnboardingData(any()),
      ).thenAnswer((_) async => const Result.failure(error: error));

      final result = await saveOnboardingData(testData);

      expect(
        result.maybeWhen(
          failure: (err) => err.runtimeType == error.runtimeType,
          orElse: () => false,
        ),
        true,
      );
    });

    test('saves empty data when provided', () async {
      when(
        () => mockRepository.saveOnboardingData(any()),
      ).thenAnswer((_) async => const Result.success(true));

      const emptyData = OnboardingData();
      final result = await saveOnboardingData(emptyData);

      expect(
        result.maybeWhen(success: (data) => data, orElse: () => false),
        true,
      );
      verify(() => mockRepository.saveOnboardingData(emptyData)).called(1);
    });
  });
}
