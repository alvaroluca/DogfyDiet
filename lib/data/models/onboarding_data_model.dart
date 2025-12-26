import 'package:dogfydiet/domain/entities/onboarding_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'onboarding_data_model.g.dart';

@JsonSerializable()
class OnboardingDataModel {
  final int? breedId;
  final String? dogName;
  final String? gender;
  final bool? isSterilized;
  final DateTime? birthDate;

  const OnboardingDataModel({
    this.breedId,
    this.dogName,
    this.gender,
    this.isSterilized,
    this.birthDate,
  });

  factory OnboardingDataModel.fromJson(Map<String, dynamic> json) =>
      _$OnboardingDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnboardingDataModelToJson(this);

  OnboardingData toEntity() => OnboardingData(
    breedId: breedId,
    dogName: dogName,
    gender: gender,
    isSterilized: isSterilized,
    birthDate: birthDate,
  );
  factory OnboardingDataModel.fromEntity(OnboardingData entity) =>
      OnboardingDataModel(
        breedId: entity.breedId,
        dogName: entity.dogName,
        gender: entity.gender,
        isSterilized: entity.isSterilized,
        birthDate: entity.birthDate,
      );
}
