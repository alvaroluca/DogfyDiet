// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Dogfy Diet';

  @override
  String get homeTitle => 'Pon comida de verdad en el bol de tu perro';

  @override
  String get homeSubtitle =>
      'Comida natural para perros, completa y equilibrada. Elaborada por nutricionistas';

  @override
  String get homeBreedLabel => 'Busca o escribe su raza';

  @override
  String get homeCta => 'Crea su menú ->';

  @override
  String get onboardingContinue => 'Continuar';

  @override
  String get breedSelectionTitle => '¿Cuál es la raza de tu perrete?';

  @override
  String dogNameTitleWithBreed(String breedName) {
    return '¿Cómo se llama tu $breedName?';
  }

  @override
  String get dogNameLabel => 'Mi perrhijo se llama...';

  @override
  String get dogNameMultiCta => '¿Tienes más de un perro?';

  @override
  String get dogNameInfoBox =>
      '¡Qué emoción! Estás a punto de mejorar la vida de tu bichón maltés a través de una alimentación 100% natural.';
}
