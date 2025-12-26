import 'package:dogfydiet/domain/entities/activity_level_type.dart';
import 'package:dogfydiet/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/domain/entities/weight_shape_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'onboarding_data_model.g.dart';

@JsonSerializable()
class OnboardingDataModel {
  final int? breedId;
  final String? dogName;
  final String? gender;
  final bool? isSterilized;
  final DateTime? birthDate;
  final WeightShapeType weightShape;
  final double? weightValue;
  final ActivityLevelType activityLevel;

  const OnboardingDataModel({
    this.breedId,
    this.dogName,
    this.gender,
    this.isSterilized,
    this.birthDate,
    this.weightShape = WeightShapeType.normal,
    this.weightValue,
    this.activityLevel = ActivityLevelType.medium,
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
    weightShape: weightShape,
    weightValue: weightValue,
    activityLevel: activityLevel,
  );
  factory OnboardingDataModel.fromEntity(OnboardingData entity) =>
      OnboardingDataModel(
        breedId: entity.breedId,
        dogName: entity.dogName,
        gender: entity.gender,
        isSterilized: entity.isSterilized,
        birthDate: entity.birthDate,
        weightShape: entity.weightShape,
        weightValue: entity.weightValue,
        activityLevel: entity.activityLevel,
      );
}
