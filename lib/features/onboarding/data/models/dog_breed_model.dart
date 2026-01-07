import 'package:dogfydiet/features/onboarding/domain/entities/dog_breed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dog_breed_model.g.dart';

@JsonSerializable()
class DogBreedModel {
  final int id;
  final String name;

  const DogBreedModel({required this.id, required this.name});

  factory DogBreedModel.fromJson(Map<String, dynamic> json) =>
      _$DogBreedModelFromJson(json);

  Map<String, dynamic> toJson() => _$DogBreedModelToJson(this);

  DogBreed toEntity() => DogBreed(id: id, name: name);

  factory DogBreedModel.fromEntity(DogBreed entity) =>
      DogBreedModel(id: entity.id, name: entity.name);
}
