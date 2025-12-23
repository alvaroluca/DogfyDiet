import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'modules/preferences_modules.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await _preferencesModulesInit();
}
