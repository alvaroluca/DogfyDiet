import 'package:dogfydiet/app/types/repository_error.dart';
import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/data/datasources/remote_data_source/dog_breed_remote_data_source.dart';
import 'package:dogfydiet/data/models/dog_breed_model.dart';
import 'package:dogfydiet/data/repositories/dog_breed_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDogBreedRemoteDataSource extends Mock
    implements DogBreedRemoteDataSource {}

void main() {
  late _MockDogBreedRemoteDataSource mockDataSource;
  late DogBreedRepositoryImpl repository;

  setUp(() {
    mockDataSource = _MockDogBreedRemoteDataSource();
    repository = DogBreedRepositoryImpl(mockDataSource);
  });

  group('DogBreedRepositoryImpl', () {
    final testBreeds = [
      const DogBreedModel(id: 1, name: 'Labrador Retriever'),
      const DogBreedModel(id: 2, name: 'German Shepherd'),
    ];

    test('getDogBreeds returns success with list of breeds', () async {
      when(
        () => mockDataSource.getDogBreeds(),
      ).thenAnswer((_) async => testBreeds);

      final result = await repository.getDogBreeds();

      expect(result, isA<Result<List>>());
      expect(
        result.when(success: (data) => data.length, failure: (error) => 0),
        2,
      );
      verify(() => mockDataSource.getDogBreeds()).called(1);
    });

    test('getDogBreeds returns success with correct breed data', () async {
      when(
        () => mockDataSource.getDogBreeds(),
      ).thenAnswer((_) async => testBreeds);

      final result = await repository.getDogBreeds();

      final breeds = result.when(
        success: (data) => data,
        failure: (error) => <dynamic>[],
      );
      expect(breeds.first.name, 'Labrador Retriever');
      expect(breeds.last.id, 2);
    });

    test('getDogBreeds returns failure when datasource throws', () async {
      when(
        () => mockDataSource.getDogBreeds(),
      ).thenThrow(Exception('Network error'));

      final result = await repository.getDogBreeds();

      expect(result, isA<Result<List>>());
      expect(
        result.when(success: (data) => null, failure: (error) => error),
        isA<RepositoryError>(),
      );
    });

    test('getDogBreeds returns failure with error message', () async {
      when(
        () => mockDataSource.getDogBreeds(),
      ).thenThrow(Exception('Connection timeout'));

      final result = await repository.getDogBreeds();

      final error = result.when(
        success: (data) => null,
        failure: (error) => error,
      );
      expect(error, isA<RepositoryError>());
      expect(error.toString(), contains('Connection timeout'));
    });

    test('getDogBreeds returns empty list when no breeds available', () async {
      when(() => mockDataSource.getDogBreeds()).thenAnswer((_) async => []);

      final result = await repository.getDogBreeds();

      final breeds = result.when(
        success: (data) => data,
        failure: (error) => <dynamic>[],
      );
      expect(breeds, isEmpty);
    });
  });
}
