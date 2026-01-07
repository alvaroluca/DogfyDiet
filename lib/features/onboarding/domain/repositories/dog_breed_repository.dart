import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/features/onboarding/domain/entities/dog_breed.dart';

abstract class DogBreedRepository {
  Future<Result<List<DogBreed>>> getDogBreeds();
}
