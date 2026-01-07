import 'dart:convert';
import 'package:dogfydiet/core/constants/app_constants.dart';
import 'package:dogfydiet/features/onboarding/data/models/onboarding_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingLocalDataSource {
  OnboardingDataModel getOnboardingData();
  Future<void> saveOnboardingData(OnboardingDataModel onboardingDataModel);
  Future<void> clearOnboardingData();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final SharedPreferences sharedPreferences;

  OnboardingLocalDataSourceImpl(this.sharedPreferences);

  @override
  OnboardingDataModel getOnboardingData() {
    final jsonString = sharedPreferences.getString(
      AppConstants.onboardingDataKey,
    );
    if (jsonString != null) {
      final jsonMap = json.decode(jsonString);
      return OnboardingDataModel.fromJson(jsonMap);
    }
    return const OnboardingDataModel();
  }

  @override
  Future<void> saveOnboardingData(
    OnboardingDataModel onboardingDataModel,
  ) async {
    final jsonString = json.encode(onboardingDataModel.toJson());
    await sharedPreferences.setString(
      AppConstants.onboardingDataKey,
      jsonString,
    );
  }

  @override
  Future<void> clearOnboardingData() async {
    await sharedPreferences.remove(AppConstants.onboardingDataKey);
  }
}
