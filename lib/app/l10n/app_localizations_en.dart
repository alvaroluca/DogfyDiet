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
}
