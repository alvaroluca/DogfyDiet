import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_event.freezed.dart';

@freezed
abstract class LanguageEvent with _$LanguageEvent {
  const factory LanguageEvent.changeLanguage(String languageCode) =
      ChangeLanguage;
  const factory LanguageEvent.loadSavedLanguage() = LoadSavedLanguage;
}
