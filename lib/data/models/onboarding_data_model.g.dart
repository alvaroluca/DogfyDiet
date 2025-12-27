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
      weightShape:
          $enumDecodeNullable(_$WeightShapeTypeEnumMap, json['weightShape']) ??
          WeightShapeType.normal,
      weightValue: (json['weightValue'] as num?)?.toDouble(),
      activityLevel:
          $enumDecodeNullable(
            _$ActivityLevelTypeEnumMap,
            json['activityLevel'],
          ) ??
          ActivityLevelType.medium,
      hasPathologies: json['hasPathologies'] as bool? ?? false,
      foodProfile:
          $enumDecodeNullable(_$FoodProfileTypeEnumMap, json['foodProfile']) ??
          FoodProfileType.gourmet,
      ownerName: json['ownerName'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$OnboardingDataModelToJson(
  OnboardingDataModel instance,
) => <String, dynamic>{
  'breedId': instance.breedId,
  'dogName': instance.dogName,
  'gender': instance.gender,
  'isSterilized': instance.isSterilized,
  'birthDate': instance.birthDate?.toIso8601String(),
  'weightShape': _$WeightShapeTypeEnumMap[instance.weightShape]!,
  'weightValue': instance.weightValue,
  'activityLevel': _$ActivityLevelTypeEnumMap[instance.activityLevel]!,
  'hasPathologies': instance.hasPathologies,
  'foodProfile': _$FoodProfileTypeEnumMap[instance.foodProfile]!,
  'ownerName': instance.ownerName,
  'location': instance.location,
};

const _$WeightShapeTypeEnumMap = {
  WeightShapeType.thin: 'thin',
  WeightShapeType.normal: 'normal',
  WeightShapeType.fat: 'fat',
};

const _$ActivityLevelTypeEnumMap = {
  ActivityLevelType.low: 'low',
  ActivityLevelType.medium: 'medium',
  ActivityLevelType.high: 'high',
};

const _$FoodProfileTypeEnumMap = {
  FoodProfileType.selective: 'selective',
  FoodProfileType.gourmet: 'gourmet',
  FoodProfileType.glutton: 'glutton',
};
