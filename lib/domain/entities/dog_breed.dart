import 'package:freezed_annotation/freezed_annotation.dart';

part 'dog_breed.freezed.dart';

@freezed
abstract class DogBreed with _$DogBreed {
  const factory DogBreed({required int id, required String name}) = _DogBreed;
}
