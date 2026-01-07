import 'package:dogfydiet/app/types/repository_error.dart';
import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/get_current_location.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/save_onboarding_data.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/submit_subscription.dart';
import 'package:dogfydiet/shared/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/shared/domain/usecases/get_dog_breeds.dart';
import 'package:dogfydiet/shared/domain/usecases/get_onboarding_data.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final GetDogBreeds getDogBreeds;
  final GetOnboardingData getOnboardingData;
  final SaveOnboardingData saveOnboardingData;
  final GetCurrentLocation getCurrentLocation;
  final SubmitSubscription submitSubscription;

  OnboardingBloc({
    required this.getDogBreeds,
    required this.getOnboardingData,
    required this.saveOnboardingData,
    required this.getCurrentLocation,
    required this.submitSubscription,
  }) : super(const OnboardingState()) {
    on<LoadDogBreeds>(_onLoadDogBreeds);
    on<LoadOnboardingData>(_onLoadOnboardingData);
    on<UpdateBreed>(_onUpdateBreed);
    on<UpdateDogName>(_onUpdateDogName);
    on<UpdateGender>(_onUpdateGender);
    on<UpdateSterilization>(_onUpdateSterilization);
    on<UpdateBirthDate>(_onUpdateBirthDate);
    on<UpdateWeightShape>(_onUpdateWeightShape);
    on<UpdateWeightValue>(_onUpdateWeightValue);
    on<UpdateActivityLevel>(_onUpdateActivityLevel);
    on<UpdateHasPathologies>(_onUpdateHasPathologies);
    on<UpdateFoodProfile>(_onUpdateFoodProfile);
    on<UpdateLocation>(_onUpdateLocation);
    on<UpdateOwnerName>(_onUpdateOwnerName);
    on<FetchLocation>(_onFetchLocation);
    on<SubmitSubscriptionEvent>(_onSubmitSubscription);
    on<ResetBreed>(_onResetBreed);
  }

  Future<void> _onLoadDogBreeds(
    LoadDogBreeds event,
    Emitter<OnboardingState> emit,
  ) async {
    final result = await getDogBreeds();
    result.when(
      failure: (RepositoryError error) => emit(
        state.copyWith(
          status: OnboardingStatus.error,
          errorMessage: error.message,
        ),
      ),
      success: (breeds) => emit(state.copyWith(dogBreeds: breeds)),
    );
  }

  void _onLoadOnboardingData(
    LoadOnboardingData event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(status: OnboardingStatus.loading));

    final result = getOnboardingData();

    result.when(
      failure: (RepositoryError error) => emit(
        state.copyWith(
          status: OnboardingStatus.error,
          errorMessage: error.message,
        ),
      ),
      success: (data) => emit(
        state.copyWith(status: OnboardingStatus.loaded, onboardingData: data),
      ),
    );
  }

  Future<void> _onUpdateBreed(
    UpdateBreed event,
    Emitter<OnboardingState> emit,
  ) async {
    final updatedData = state.onboardingData.copyWith(breedId: event.breedId);
    emit(state.copyWith(onboardingData: updatedData));
    await _saveData(updatedData);
  }

  Future<void> _onUpdateDogName(
    UpdateDogName event,
    Emitter<OnboardingState> emit,
  ) async {
    final updatedData = state.onboardingData.copyWith(dogName: event.dogName);
    emit(state.copyWith(onboardingData: updatedData));
    await _saveData(updatedData);
  }

  Future<void> _onUpdateGender(
    UpdateGender event,
    Emitter<OnboardingState> emit,
  ) async {
    final updatedData = state.onboardingData.copyWith(gender: event.gender);
    emit(state.copyWith(onboardingData: updatedData));
    await _saveData(updatedData);
  }

  Future<void> _onUpdateSterilization(
    UpdateSterilization event,
    Emitter<OnboardingState> emit,
  ) async {
    final updatedData = state.onboardingData.copyWith(
      isSterilized: event.isSterilized,
    );
    emit(state.copyWith(onboardingData: updatedData));
    await _saveData(updatedData);
  }

  Future<void> _onUpdateBirthDate(
    UpdateBirthDate event,
    Emitter<OnboardingState> emit,
  ) async {
    final updatedData = state.onboardingData.copyWith(
      birthDate: event.birthDate,
    );
    emit(state.copyWith(onboardingData: updatedData));
    await _saveData(updatedData);
  }

  Future<void> _onUpdateWeightShape(
    UpdateWeightShape event,
    Emitter<OnboardingState> emit,
  ) async {
    final updatedData = state.onboardingData.copyWith(
      weightShape: event.weightShape,
    );
    emit(state.copyWith(onboardingData: updatedData));
    await _saveData(updatedData);
  }

  Future<void> _onUpdateWeightValue(
    UpdateWeightValue event,
    Emitter<OnboardingState> emit,
  ) async {
    final updatedData = state.onboardingData.copyWith(weightValue: event.value);
    emit(state.copyWith(onboardingData: updatedData));
    await _saveData(updatedData);
  }

  Future<void> _onUpdateActivityLevel(
    UpdateActivityLevel event,
    Emitter<OnboardingState> emit,
  ) async {
    final updatedData = state.onboardingData.copyWith(
      activityLevel: event.activityLevel,
    );
    emit(state.copyWith(onboardingData: updatedData));
    await _saveData(updatedData);
  }

  Future<void> _onUpdateHasPathologies(
    UpdateHasPathologies event,
    Emitter<OnboardingState> emit,
  ) async {
    final updatedData = state.onboardingData.copyWith(
      hasPathologies: event.hasPathologies,
    );
    emit(state.copyWith(onboardingData: updatedData));
    await _saveData(updatedData);
  }

  Future<void> _onUpdateFoodProfile(
    UpdateFoodProfile event,
    Emitter<OnboardingState> emit,
  ) async {
    final updatedData = state.onboardingData.copyWith(
      foodProfile: event.foodProfile,
    );
    emit(state.copyWith(onboardingData: updatedData));
    await _saveData(updatedData);
  }

  Future<void> _onUpdateLocation(
    UpdateLocation event,
    Emitter<OnboardingState> emit,
  ) async {
    final updatedData = state.onboardingData.copyWith(location: event.location);
    emit(state.copyWith(onboardingData: updatedData));
    await _saveData(updatedData);
  }

  Future<void> _onUpdateOwnerName(
    UpdateOwnerName event,
    Emitter<OnboardingState> emit,
  ) async {
    final updatedData = state.onboardingData.copyWith(
      ownerName: event.ownerName,
    );
    emit(state.copyWith(onboardingData: updatedData));
    await _saveData(updatedData);
  }

  Future<void> _onFetchLocation(
    FetchLocation event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(isLocationLoading: true));

    final result = await getCurrentLocation();

    result.when(
      failure: (RepositoryError error) => emit(
        state.copyWith(isLocationLoading: false, errorMessage: error.message),
      ),
      success: (location) async {
        final updatedData = state.onboardingData.copyWith(location: location);
        emit(
          state.copyWith(onboardingData: updatedData, isLocationLoading: false),
        );
        await _saveData(updatedData);
      },
    );
  }

  Future<void> _onSubmitSubscription(
    SubmitSubscriptionEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(status: OnboardingStatus.submitting));

    final result = await submitSubscription(state.onboardingData);

    result.when(
      failure: (RepositoryError error) => emit(
        state.copyWith(
          status: OnboardingStatus.error,
          errorMessage: error.message,
        ),
      ),
      success: (success) async {
        emit(state.copyWith(status: OnboardingStatus.success));
        await _saveData(const OnboardingData());
      },
    );
  }

  Future<void> _onResetBreed(
    ResetBreed event,
    Emitter<OnboardingState> emit,
  ) async {
    const resetData = OnboardingData();
    emit(state.copyWith(onboardingData: resetData));
    await _saveData(resetData);
  }

  Future<void> _saveData(OnboardingData data) async {
    try {
      await saveOnboardingData(data);
    } catch (e) {
      debugPrint('Failed to save onboarding data: $e');
    }
  }
}
