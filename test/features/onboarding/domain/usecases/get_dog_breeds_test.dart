import 'package:dogfydiet/app/types/repository_error.dart';
import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/features/onboarding/domain/entities/dog_breed.dart';
import 'package:dogfydiet/features/onboarding/domain/repositories/dog_breed_repository.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/get_dog_breeds.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDogBreedRepository extends Mock implements DogBreedRepository {}

void main() {
  late GetDogBreeds usecase;
  late _MockDogBreedRepository mockRepository;

  setUp(() {
    mockRepository = _MockDogBreedRepository();
    usecase = GetDogBreeds(mockRepository);
  });

  group('GetDogBreeds UseCase', () {
    final testBreeds = [
      const DogBreed(id: 1, name: 'Labrador Retriever'),
      const DogBreed(id: 2, name: 'German Shepherd'),
    ];

    test('calls repository.getDogBreeds', () async {
      when(
        () => mockRepository.getDogBreeds(),
      ).thenAnswer((_) async => Result.success(testBreeds));

      await usecase();

      verify(() => mockRepository.getDogBreeds()).called(1);
    });

    test('returns success when repository succeeds', () async {
      when(
        () => mockRepository.getDogBreeds(),
      ).thenAnswer((_) async => Result.success(testBreeds));

      final result = await usecase();

      expect(result, isA<Result<List>>());
      final breeds = result.when(
        success: (data) => data,
        failure: (error) => <dynamic>[],
      );
      expect(breeds.length, 2);
      expect(breeds.first.name, 'Labrador Retriever');
    });

    test('returns error when repository fails', () async {
      const error = RepositoryError.unknown(message: 'Network error');
      when(
        () => mockRepository.getDogBreeds(),
      ).thenAnswer((_) async => const Result.failure(error: error));

      final result = await usecase();

      expect(result, isA<Result<List>>());
      expect(
        result.when(success: (data) => null, failure: (error) => error),
        error,
      );
    });

    test('propagates repository errors to caller', () async {
      const error = RepositoryError.unknown(message: 'Connection timeout');
      when(
        () => mockRepository.getDogBreeds(),
      ).thenAnswer((_) async => const Result.failure(error: error));

      final result = await usecase();

      result.when(
        success: (data) => fail('Should have failed'),
        failure: (error) => expect(error.message, 'Connection timeout'),
      );
    });
  });
}
