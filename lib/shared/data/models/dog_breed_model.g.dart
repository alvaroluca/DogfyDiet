// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_breed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogBreedModel _$DogBreedModelFromJson(Map<String, dynamic> json) =>
    DogBreedModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$DogBreedModelToJson(DogBreedModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
