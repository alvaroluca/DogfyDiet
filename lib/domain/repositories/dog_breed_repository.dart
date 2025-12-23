import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/domain/entities/dog_breed.dart';

abstract class DogBreedRepository {
  Future<Result<List<DogBreed>>> getDogBreeds();
}
