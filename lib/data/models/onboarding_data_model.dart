import 'package:dogfydiet/domain/entities/onboarding_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'onboarding_data_model.g.dart';

@JsonSerializable()
class OnboardingDataModel {
  final int? breedId;
  final String? dogName;

  const OnboardingDataModel({this.breedId, this.dogName});

  factory OnboardingDataModel.fromJson(Map<String, dynamic> json) =>
      _$OnboardingDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnboardingDataModelToJson(this);

  OnboardingData toEntity() =>
      OnboardingData(breedId: breedId, dogName: dogName);
  factory OnboardingDataModel.fromEntity(OnboardingData entity) =>
      OnboardingDataModel(breedId: entity.breedId, dogName: entity.dogName);
}
