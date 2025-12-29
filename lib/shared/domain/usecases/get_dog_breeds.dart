import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/shared/domain/entities/dog_breed.dart';
import 'package:dogfydiet/shared/domain/repositories/dog_breed_repository.dart';

class GetDogBreeds {
  final DogBreedRepository repository;

  GetDogBreeds(this.repository);

  Future<Result<List<DogBreed>>> call() async {
    return await repository.getDogBreeds();
  }
}
