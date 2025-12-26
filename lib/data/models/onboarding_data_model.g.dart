// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnboardingDataModel _$OnboardingDataModelFromJson(Map<String, dynamic> json) =>
    OnboardingDataModel(
      breedId: (json['breedId'] as num?)?.toInt(),
      dogName: json['dogName'] as String?,
      gender: json['gender'] as String?,
      isSterilized: json['isSterilized'] as bool?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
    );

Map<String, dynamic> _$OnboardingDataModelToJson(
  OnboardingDataModel instance,
) => <String, dynamic>{
  'breedId': instance.breedId,
  'dogName': instance.dogName,
  'gender': instance.gender,
  'isSterilized': instance.isSterilized,
  'birthDate': instance.birthDate?.toIso8601String(),
};
