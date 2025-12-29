import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_state.freezed.dart';

@freezed
abstract class LanguageState with _$LanguageState {
  const factory LanguageState({required Locale locale}) = _LanguageState;

  factory LanguageState.initial() => const LanguageState(
    locale: Locale('es', ''), // Default to Spanish
  );
}
