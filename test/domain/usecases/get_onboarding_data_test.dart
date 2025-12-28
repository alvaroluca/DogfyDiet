import 'package:dogfydiet/app/types/repository_error.dart';
import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/domain/entities/activity_level_type.dart';
import 'package:dogfydiet/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/domain/repositories/onboarding_repository.dart';
import 'package:dogfydiet/domain/usecases/get_onboarding_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockOnboardingRepository extends Mock implements OnboardingRepository {}

void main() {
  late GetOnboardingData usecase;
  late _MockOnboardingRepository mockRepository;

  setUp(() {
    mockRepository = _MockOnboardingRepository();
    usecase = GetOnboardingData(mockRepository);
  });

  group('GetOnboardingData UseCase', () {
    const testData = OnboardingData(
      dogName: 'Buddy',
      ownerName: 'John Doe',
      location: 'Madrid',
      breedId: 1,
      activityLevel: ActivityLevelType.high,
    );

    test('calls repository.getOnboardingData', () async {
      when(
        () => mockRepository.getOnboardingData(),
      ).thenAnswer((_) async => const Result.success(testData));

      await usecase();

      verify(() => mockRepository.getOnboardingData()).called(1);
    });

    test('returns success with onboarding data', () async {
      when(
        () => mockRepository.getOnboardingData(),
      ).thenAnswer((_) async => const Result.success(testData));

      final result = await usecase();

      expect(result, isA<Result<OnboardingData>>());
      expect(
        result.when(success: (data) => data.dogName, failure: (error) => null),
        'Buddy',
      );
    });

    test('returns empty data when no data is saved', () async {
      const emptyData = OnboardingData();
      when(
        () => mockRepository.getOnboardingData(),
      ).thenAnswer((_) async => const Result.success(emptyData));

      final result = await usecase();

      final data = result.when(
        success: (data) => data,
        failure: (error) => null,
      );
      expect(data?.dogName, isNull);
      expect(data?.ownerName, isNull);
    });

    test('returns error when repository fails', () async {
      const error = RepositoryError.unknown(message: 'Storage error');
      when(
        () => mockRepository.getOnboardingData(),
      ).thenAnswer((_) async => const Result.failure(error: error));

      final result = await usecase();

      expect(result, isA<Result<OnboardingData>>());
      expect(
        result.when(success: (data) => null, failure: (error) => error.message),
        'Storage error',
      );
    });

    test('preserves all onboarding data fields on success', () async {
      when(
        () => mockRepository.getOnboardingData(),
      ).thenAnswer((_) async => const Result.success(testData));

      final result = await usecase();

      final data = result.when(
        success: (data) => data,
        failure: (error) => null,
      );
      expect(data?.dogName, 'Buddy');
      expect(data?.ownerName, 'John Doe');
      expect(data?.location, 'Madrid');
      expect(data?.breedId, 1);
      expect(data?.activityLevel, ActivityLevelType.high);
    });
  });
}
