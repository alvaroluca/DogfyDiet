import 'package:dogfydiet/app/types/repository_error.dart';
import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/domain/repositories/location_repository.dart';
import 'package:dogfydiet/domain/usecases/get_current_location.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockLocationRepository extends Mock implements LocationRepository {}

void main() {
  late GetCurrentLocation usecase;
  late _MockLocationRepository mockRepository;

  setUp(() {
    mockRepository = _MockLocationRepository();
    usecase = GetCurrentLocation(mockRepository);
  });

  group('GetCurrentLocation UseCase', () {
    const testAddress = 'Main St, Madrid, Spain';

    test('calls repository.getCurrentLocation', () async {
      when(
        () => mockRepository.getCurrentLocation(),
      ).thenAnswer((_) async => const Result.success(testAddress));

      await usecase();

      verify(() => mockRepository.getCurrentLocation()).called(1);
    });

    test('returns success with location address', () async {
      when(
        () => mockRepository.getCurrentLocation(),
      ).thenAnswer((_) async => const Result.success(testAddress));

      final result = await usecase();

      expect(result, isA<Result<String>>());
      expect(
        result.when(success: (data) => data, failure: (error) => null),
        testAddress,
      );
    });

    test('returns error when service is disabled', () async {
      const error = RepositoryError.unknown(
        message: 'Location services are disabled.',
      );
      when(
        () => mockRepository.getCurrentLocation(),
      ).thenAnswer((_) async => const Result.failure(error: error));

      final result = await usecase();

      expect(result, isA<Result<String>>());
      expect(
        result.when(success: (data) => null, failure: (error) => error),
        error,
      );
    });

    test('returns error when permissions are denied', () async {
      const error = RepositoryError.unknown(
        message: 'Location permissions are denied',
      );
      when(
        () => mockRepository.getCurrentLocation(),
      ).thenAnswer((_) async => const Result.failure(error: error));

      final result = await usecase();

      result.when(
        success: (data) => fail('Should have failed'),
        failure: (error) =>
            expect(error.message, 'Location permissions are denied'),
      );
    });

    test('returns error when location is unavailable', () async {
      const error = RepositoryError.unknown(message: 'GPS not available');
      when(
        () => mockRepository.getCurrentLocation(),
      ).thenAnswer((_) async => const Result.failure(error: error));

      final result = await usecase();

      expect(
        result.when(success: (data) => null, failure: (error) => error.message),
        'GPS not available',
      );
    });
  });
}
