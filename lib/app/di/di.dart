import 'package:dogfydiet/data/repositories/datasources/remote_data_source/dog_breed_remote_data_source.dart';
import 'package:dogfydiet/data/repositories/dog_breed_repository_impl.dart';
import 'package:dogfydiet/domain/repositories/dog_breed_repository.dart';
import 'package:dogfydiet/domain/usecases/get_dog_breeds.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'modules/preferences_modules.dart';
part 'modules/ui_modules.dart';
part 'modules/usecase_modules.dart';
part 'modules/repository_modules.dart';
part 'modules/remote_modules.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await _preferencesModulesInit();
  _uiModulesInit();
  _useCaseModulesInit();
  _repositoryModulesInit();
  _remoteModulesInit();
}
