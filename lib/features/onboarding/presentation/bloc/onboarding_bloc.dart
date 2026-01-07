import 'package:dogfydiet/core/types/repository_error.dart';
import 'package:dogfydiet/core/types/result.dart';
import 'package:dogfydiet/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/get_current_location.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/get_dog_breeds.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/get_onboarding_data.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/save_onboarding_data.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/submit_subscription.dart';
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
    _updateData<UpdateBreed>(
      (data, event) => data.copyWith(breedId: event.breedId),
    );
    _updateData<UpdateDogName>(
      (data, event) => data.copyWith(dogName: event.dogName),
    );
    _updateData<UpdateGender>(
      (data, event) => data.copyWith(gender: event.gender),
    );
    _updateData<UpdateSterilization>(
      (data, event) => data.copyWith(isSterilized: event.isSterilized),
    );
    _updateData<UpdateBirthDate>(
      (data, event) => data.copyWith(birthDate: event.birthDate),
    );
    _updateData<UpdateWeightShape>(
      (data, event) => data.copyWith(weightShape: event.weightShape),
    );
    _updateData<UpdateWeightValue>(
      (data, event) => data.copyWith(weightValue: event.value),
    );
    _updateData<UpdateActivityLevel>(
      (data, event) => data.copyWith(activityLevel: event.activityLevel),
    );
    _updateData<UpdateHasPathologies>(
      (data, event) => data.copyWith(hasPathologies: event.hasPathologies),
    );
    _updateData<UpdateFoodProfile>(
      (data, event) => data.copyWith(foodProfile: event.foodProfile),
    );
    _updateData<UpdateLocation>(
      (data, event) => data.copyWith(location: event.location),
    );
    _updateData<UpdateOwnerName>(
      (data, event) => data.copyWith(ownerName: event.ownerName),
    );
    on<FetchLocation>(_onFetchLocation);
    on<SubmitSubscriptionEvent>(_onSubmitSubscription);
    _updateData<ResetBreed>((_, __) => const OnboardingData());
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
        emit(state.copyWith(isLocationLoading: false));
        await _saveData(emit, (d) => d.copyWith(location: location));
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
      success: (_) async {
        emit(state.copyWith(status: OnboardingStatus.success));
        await _saveData(emit, (_) => const OnboardingData());
      },
    );
  }

  void _updateData<T extends OnboardingEvent>(
    OnboardingData Function(OnboardingData, T) updater,
  ) {
    on<T>((event, emit) => _saveData(emit, (data) => updater(data, event)));
  }

  Future<void> _saveData(
    Emitter<OnboardingState> emit,
    OnboardingData Function(OnboardingData) updater,
  ) async {
    final updated = updater(state.onboardingData);
    emit(state.copyWith(onboardingData: updated));
    try {
      await saveOnboardingData(updated);
    } catch (e) {
      debugPrint('Failed to save onboarding data: $e');
    }
  }
}
