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
}
