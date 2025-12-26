// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnboardingDataModel _$OnboardingDataModelFromJson(Map<String, dynamic> json) =>
    OnboardingDataModel(
      breedId: (json['breedId'] as num?)?.toInt(),
      dogName: json['dogName'] as String?,
    );

Map<String, dynamic> _$OnboardingDataModelToJson(
  OnboardingDataModel instance,
) => <String, dynamic>{
  'breedId': instance.breedId,
  'dogName': instance.dogName,
};
