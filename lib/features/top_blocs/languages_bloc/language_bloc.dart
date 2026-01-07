import 'package:dogfydiet/app/constants/app_constants.dart';
import 'package:dogfydiet/features/top_blocs/languages_bloc/language_event.dart';
import 'package:dogfydiet/features/top_blocs/languages_bloc/language_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// BLoC for managing application language.
class LanguagesBloc extends Bloc<LanguageEvent, LanguageState> {
  final SharedPreferences _prefs;

  LanguagesBloc(this._prefs) : super(LanguageState.initial()) {
    on<LoadSavedLanguage>(_onLoadSavedLanguage);
    on<ChangeLanguage>(_onChangeLanguage);

    // Load saved language on initialization
    add(const LanguageEvent.loadSavedLanguage());
  }

  Future<void> _onLoadSavedLanguage(
    LoadSavedLanguage event,
    Emitter<LanguageState> emit,
  ) async {
    final languageCode = _prefs.getString(AppConstants.languageKey) ?? 'es';
    emit(state.copyWith(locale: Locale(languageCode, '')));
  }

  Future<void> _onChangeLanguage(
    ChangeLanguage event,
    Emitter<LanguageState> emit,
  ) async {
    await _prefs.setString(AppConstants.languageKey, event.languageCode);
    emit(state.copyWith(locale: Locale(event.languageCode, '')));
  }
}
