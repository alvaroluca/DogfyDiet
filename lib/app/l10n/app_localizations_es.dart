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

  @override
  String genderTitle(String dogName) {
    return '¡Queremos conocer a $dogName!';
  }

  @override
  String get genderMale => 'Macho';

  @override
  String get genderFemale => 'Hembra';

  @override
  String get sterilizationQuestion => '¿Está esterilizado/a?';

  @override
  String get commonYes => 'Sí';

  @override
  String get commonNo => 'No';

  @override
  String get genderSterilizationInfoBox =>
      '¿Por qué es importante? Después de la esterilización, se requieren ajustes en la ración, ya que el perro suele tener menor gasto calórico.';

  @override
  String birthDateTitle(String dogName) {
    return '¿Cuándo nació $dogName?';
  }

  @override
  String get birthDateYearLabel => 'Año';

  @override
  String get birthDateMonthLabel => 'Mes';

  @override
  String get birthDateInfoBox =>
      '¿Por qué es importante? Las necesidades calóricas varían según la edad de tu perro, pero nos adaptaremos perfectamente a su momento vital.';

  @override
  String get weightStepOptionThin =>
      'Un poco flaquito: Cintura estrecha y se le ven claramente las costillas.';

  @override
  String get weightStepOptionNormal =>
      'Hecho un figurín: La cintura es visible y sus costillas son fáciles de palpar.';

  @override
  String get weightStepOptionFat =>
      'Un poco rellenito: La cintura no es visible y sus costillas son difíciles de palpar.';

  @override
  String weightStepTitle(String dogName) {
    return '¿Qué silueta representa mejor a $dogName?';
  }

  @override
  String get weightStepSubtitle =>
      'Selecciona la figura que más se asemeja en cuanto a su peso y forma';

  @override
  String weightStepBottomText(String dogName) {
    return 'El peso de $dogName es más o menos de';
  }

  @override
  String get weightStepKg => 'kg';

  @override
  String get activityLowDescription =>
      'Perro alfombra: paseos diarios de menos de 1h. Lo que más le gusta es echarse una buena siesta  y estar bien tranquilito.';

  @override
  String get activityMediumDescription =>
      'Perro zen: paseos diarios de 1 a 2h. Sabe disfrutar de buenas caminatas, pero también sabe cuándo descansar';

  @override
  String get activityHighDescription =>
      'Perro terremoto: paseos diarios de más de 2h. ¡No veas qué torbellino de energía!';

  @override
  String activityLevelTitle(String dogName) {
    return '¿Cuál es el nivel de actividad de $dogName?';
  }

  @override
  String get activityLevelSubtitle =>
      'Esto nos ayuda a ofrecerte mejores recomendaciones';
}
