import 'package:dogfydiet/app/types/repository_error.dart';
import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/data/repositories/datasources/remote_data_source/dog_breed_remote_data_source.dart';
import 'package:dogfydiet/domain/entities/dog_breed.dart';
import 'package:dogfydiet/domain/repositories/dog_breed_repository.dart';

class DogBreedRepositoryImpl implements DogBreedRepository {
  final DogBreedRemoteDataSource dataSource;

  DogBreedRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<DogBreed>>> getDogBreeds() async {
    try {
      final breeds = await dataSource.getDogBreeds();
      return Result.success(breeds.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Result.failure(
        error: RepositoryError.unknown(message: e.toString()),
      );
    }
  }
}
