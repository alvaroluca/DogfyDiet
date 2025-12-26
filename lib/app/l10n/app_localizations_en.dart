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
}
