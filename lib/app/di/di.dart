import 'package:dogfydiet/data/datasources/local_data_source/onboarding_local_data_source.dart';
import 'package:dogfydiet/data/datasources/remote_data_source/dog_breed_remote_data_source.dart';
import 'package:dogfydiet/data/repositories/dog_breed_repository_impl.dart';
import 'package:dogfydiet/data/repositories/onboarding_repository_impl.dart';
import 'package:dogfydiet/domain/repositories/dog_breed_repository.dart';
import 'package:dogfydiet/domain/repositories/onboarding_repository.dart';
import 'package:dogfydiet/domain/usecases/get_dog_breeds.dart';
import 'package:dogfydiet/domain/usecases/get_onboarding_data.dart';
import 'package:dogfydiet/domain/usecases/save_onboarding_data.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/steps/cubit/birth_date/birth_date_cubit.dart';
import 'package:dogfydiet/presentation/features/onboarding/steps/cubit/dog_name/dog_name_cubit.dart';
import 'package:dogfydiet/presentation/features/onboarding/steps/cubit/onboarding_step/onboarding_step_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'modules/preferences_modules.dart';
part 'modules/ui_modules.dart';
part 'modules/usecase_modules.dart';
part 'modules/repository_modules.dart';
part 'modules/remote_modules.dart';
part 'modules/local_modules.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await _preferencesModulesInit();
  _uiModulesInit();
  _useCaseModulesInit();
  _repositoryModulesInit();
  _remoteModulesInit();
  _localModulesInit();
}
