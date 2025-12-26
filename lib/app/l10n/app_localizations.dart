import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Dogfy Diet'**
  String get appTitle;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Put real food in your dog\'s bowl'**
  String get homeTitle;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Natural food for dogs, complete and balanced. Created by nutritionists'**
  String get homeSubtitle;

  /// No description provided for @homeBreedLabel.
  ///
  /// In en, this message translates to:
  /// **'Search or type their breed'**
  String get homeBreedLabel;

  /// No description provided for @homeCta.
  ///
  /// In en, this message translates to:
  /// **'Create their menu ->'**
  String get homeCta;

  /// No description provided for @onboardingContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboardingContinue;

  /// No description provided for @breedSelectionTitle.
  ///
  /// In en, this message translates to:
  /// **'What is your dog\'s breed?'**
  String get breedSelectionTitle;

  /// Title asking for the dog's name including the breed
  ///
  /// In en, this message translates to:
  /// **'What\'s your {breedName}\'s name?'**
  String dogNameTitleWithBreed(String breedName);

  /// No description provided for @dogNameLabel.
  ///
  /// In en, this message translates to:
  /// **'My dog\'s name is...'**
  String get dogNameLabel;

  /// No description provided for @dogNameMultiCta.
  ///
  /// In en, this message translates to:
  /// **'Do you have more than one dog?'**
  String get dogNameMultiCta;

  /// No description provided for @dogNameInfoBox.
  ///
  /// In en, this message translates to:
  /// **'How exciting! You\'re about to improve your Maltese\'s life with 100% natural food.'**
  String get dogNameInfoBox;

  /// Title for the dog's gender screen
  ///
  /// In en, this message translates to:
  /// **'We want to know {dogName}!'**
  String genderTitle(String dogName);

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @sterilizationQuestion.
  ///
  /// In en, this message translates to:
  /// **'Is your dog neutered/spayed?'**
  String get sterilizationQuestion;

  /// No description provided for @commonYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get commonYes;

  /// No description provided for @commonNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get commonNo;

  /// No description provided for @genderSterilizationInfoBox.
  ///
  /// In en, this message translates to:
  /// **'Why is it important? After sterilization, adjustments are needed in the food portion, as dogs usually have lower caloric expenditure.'**
  String get genderSterilizationInfoBox;

  /// Question about the dog's birth date
  ///
  /// In en, this message translates to:
  /// **'When was {dogName} born?'**
  String birthDateTitle(String dogName);

  /// No description provided for @birthDateYearLabel.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get birthDateYearLabel;

  /// No description provided for @birthDateMonthLabel.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get birthDateMonthLabel;

  /// No description provided for @birthDateInfoBox.
  ///
  /// In en, this message translates to:
  /// **'Why is it important? Caloric needs vary according to your dog\'s age, but we will perfectly adapt to their life stage.'**
  String get birthDateInfoBox;

  /// No description provided for @weightStepOptionThin.
  ///
  /// In en, this message translates to:
  /// **'A bit skinny: Narrow waist and clearly visible ribs.'**
  String get weightStepOptionThin;

  /// No description provided for @weightStepOptionNormal.
  ///
  /// In en, this message translates to:
  /// **'Fit: Waist is visible and ribs are easy to feel.'**
  String get weightStepOptionNormal;

  /// No description provided for @weightStepOptionFat.
  ///
  /// In en, this message translates to:
  /// **'A bit chubby: Waist is not visible and ribs are hard to feel.'**
  String get weightStepOptionFat;

  /// Title for the visual weight step, includes the dog's name
  ///
  /// In en, this message translates to:
  /// **'Which silhouette best represents {dogName}?'**
  String weightStepTitle(String dogName);

  /// No description provided for @weightStepSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select the figure that most closely matches their weight and shape'**
  String get weightStepSubtitle;

  /// Bottom text for the weight step, includes the dog's name
  ///
  /// In en, this message translates to:
  /// **'{dogName}\'s weight is about'**
  String weightStepBottomText(String dogName);

  /// No description provided for @weightStepKg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get weightStepKg;

  /// No description provided for @activityLowDescription.
  ///
  /// In en, this message translates to:
  /// **'Couch dog: daily walks less than 1h. Loves a good nap and being super chill.'**
  String get activityLowDescription;

  /// No description provided for @activityMediumDescription.
  ///
  /// In en, this message translates to:
  /// **'Zen dog: daily walks 1-2h. Enjoys good walks but also knows when to rest.'**
  String get activityMediumDescription;

  /// No description provided for @activityHighDescription.
  ///
  /// In en, this message translates to:
  /// **'Tornado dog: daily walks more than 2h. So much energy!'**
  String get activityHighDescription;

  /// Title for the activity step, includes the dog's name
  ///
  /// In en, this message translates to:
  /// **'What\'s {dogName}\'s activity level?'**
  String activityLevelTitle(String dogName);

  /// No description provided for @activityLevelSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This helps us give you better recommendations'**
  String get activityLevelSubtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
