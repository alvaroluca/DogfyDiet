// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Dogfy Diet';

  @override
  String get homeTitle => 'Put real food in your dog\'s bowl';

  @override
  String get homeSubtitle =>
      'Natural food for dogs, complete and balanced. Created by nutritionists';

  @override
  String get homeBreedLabel => 'Search or type their breed';

  @override
  String get homeCta => 'Create their menu ->';

  @override
  String get onboardingContinue => 'Continue';

  @override
  String get breedSelectionTitle => 'What is your dog\'s breed?';

  @override
  String dogNameTitleWithBreed(String breedName) {
    return 'What\'s your $breedName\'s name?';
  }

  @override
  String get dogNameLabel => 'My dog\'s name is...';

  @override
  String get dogNameMultiCta => 'Do you have more than one dog?';

  @override
  String get dogNameInfoBox =>
      'How exciting! You\'re about to improve your Maltese\'s life with 100% natural food.';

  @override
  String genderTitle(String dogName) {
    return 'We want to know $dogName!';
  }

  @override
  String get genderMale => 'Male';

  @override
  String get genderFemale => 'Female';

  @override
  String get sterilizationQuestion => 'Is your dog neutered/spayed?';

  @override
  String get commonYes => 'Yes';

  @override
  String get commonNo => 'No';

  @override
  String get genderSterilizationInfoBox =>
      'Why is it important? After sterilization, adjustments are needed in the food portion, as dogs usually have lower caloric expenditure.';

  @override
  String birthDateTitle(String dogName) {
    return 'When was $dogName born?';
  }

  @override
  String get birthDateYearLabel => 'Year';

  @override
  String get birthDateMonthLabel => 'Month';

  @override
  String get birthDateInfoBox =>
      'Why is it important? Caloric needs vary according to your dog\'s age, but we will perfectly adapt to their life stage.';

  @override
  String get weightStepOptionThin =>
      'A bit skinny: Narrow waist and clearly visible ribs.';

  @override
  String get weightStepOptionNormal =>
      'Fit: Waist is visible and ribs are easy to feel.';

  @override
  String get weightStepOptionFat =>
      'A bit chubby: Waist is not visible and ribs are hard to feel.';

  @override
  String weightStepTitle(String dogName) {
    return 'Which silhouette best represents $dogName?';
  }

  @override
  String get weightStepSubtitle =>
      'Select the figure that most closely matches their weight and shape';

  @override
  String weightStepBottomText(String dogName) {
    return '$dogName\'s weight is about';
  }

  @override
  String get weightStepKg => 'kg';

  @override
  String get activityLowDescription =>
      'Couch dog: daily walks less than 1h. Loves a good nap and being super chill.';

  @override
  String get activityMediumDescription =>
      'Zen dog: daily walks 1-2h. Enjoys good walks but also knows when to rest.';

  @override
  String get activityHighDescription =>
      'Tornado dog: daily walks more than 2h. So much energy!';

  @override
  String activityLevelTitle(String dogName) {
    return 'What\'s $dogName\'s activity level?';
  }

  @override
  String get activityLevelSubtitle =>
      'This helps us give you better recommendations';

  @override
  String pathologiesTitle(String dogName) {
    return 'Does $dogName have any health issues?';
  }

  @override
  String get pathologiesInfoBox =>
      'Every dog is unique! Don\'t worry, we will adapt our menu to their case whenever possible. If your dog\'s condition does not appear in the form, send an email to nutricionistas@dogfydiet.com.';

  @override
  String get foodProfileSelectiveDescription =>
      'The selective: picky eater, often doesn\'t finish their meal and gets bored of food (wait until they try Dogfy!)';

  @override
  String get foodProfileGourmetDescription =>
      'The gourmet: loves trying new flavors, but won\'t settle for just anything';

  @override
  String get foodProfileGluttonDescription =>
      'The glutton: devours all kinds of food as if it were their last meal';

  @override
  String get foodProfileTitle => 'What kind of foodie is your dog?';

  @override
  String foodProfileSubtitle(String dogName) {
    return 'Choose the option that best describes $dogName.';
  }

  @override
  String ownerInfoTitle(String dogName) {
    return '$dogName\'s special menu is almost ready!';
  }

  @override
  String get ownerNameLabel => 'Your name';

  @override
  String get ownerLocationLabel => 'Location';

  @override
  String get ownerLocationPermissionDeniedTitle => 'Location permission denied';

  @override
  String get ownerLocationPermissionDeniedDialog =>
      'To autocomplete your address, allow location access in your device settings. You can also enter your address manually.';

  @override
  String get ownerInfoInfoBox =>
      'By continuing, your progress will be saved and you will be accepting the terms and conditions and privacy policy to receive the best feeding recommendations.';

  @override
  String get onboardingSubmit => 'Send';
}
