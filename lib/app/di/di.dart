import 'package:dogfydiet/features/onboarding/data/datasources/local_data_source/geolocation_local_data_source.dart';
import 'package:dogfydiet/features/onboarding/data/datasources/local_data_source/permission_local_data_source.dart';
import 'package:dogfydiet/features/onboarding/data/datasources/remote_data_source/location_remote_data_source.dart';
import 'package:dogfydiet/features/onboarding/data/datasources/remote_data_source/subscription_remote_data_source.dart';
import 'package:dogfydiet/features/onboarding/data/repositories/location_repository_impl.dart';
import 'package:dogfydiet/features/onboarding/domain/repositories/location_repository.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/get_current_location.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/save_onboarding_data.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/submit_subscription.dart';
import 'package:dogfydiet/features/onboarding/presentation/cubit/onboarding_step_cubit.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/cubit/birth_date/birth_date_cubit.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/cubit/dog_name/dog_name_cubit.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/cubit/owner_info/owner_info_cubit.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/cubit/weight/weight_cubit.dart';
import 'package:dogfydiet/shared/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/shared/data/datasources/local_data_source/onboarding_local_data_source.dart';
import 'package:dogfydiet/shared/data/datasources/remote_data_source/dog_breed_remote_data_source.dart';
import 'package:dogfydiet/shared/data/repositories/dog_breed_repository_impl.dart';
import 'package:dogfydiet/shared/data/repositories/onboarding_repository_impl.dart';
import 'package:dogfydiet/shared/domain/repositories/dog_breed_repository.dart';
import 'package:dogfydiet/shared/domain/repositories/onboarding_repository.dart';
import 'package:dogfydiet/shared/domain/usecases/get_dog_breeds.dart';
import 'package:dogfydiet/shared/domain/usecases/get_onboarding_data.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'modules/local_modules.dart';
part 'modules/preferences_modules.dart';
part 'modules/remote_modules.dart';
part 'modules/repository_modules.dart';
part 'modules/ui_modules.dart';
part 'modules/usecase_modules.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await _preferencesModulesInit();
  _uiModulesInit();
  _useCaseModulesInit();
  _repositoryModulesInit();
  _remoteModulesInit();
  _localModulesInit();
}
