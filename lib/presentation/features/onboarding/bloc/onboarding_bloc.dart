import 'package:dogfydiet/app/types/repository_error.dart';
import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/domain/usecases/get_dog_breeds.dart';
import 'package:dogfydiet/domain/usecases/get_onboarding_data.dart';
import 'package:dogfydiet/domain/usecases/save_onboarding_data.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final GetDogBreeds getDogBreeds;
  final GetOnboardingData getOnboardingData;
  final SaveOnboardingData saveOnboardingData;

  OnboardingBloc({
    required this.getDogBreeds,
    required this.getOnboardingData,
    required this.saveOnboardingData,
  }) : super(const OnboardingState()) {
    on<LoadDogBreeds>(_onLoadDogBreeds);
    on<LoadOnboardingData>(_onLoadOnboardingData);
    on<UpdateBreed>(_onUpdateBreed);
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

  Future<void> _onLoadOnboardingData(
    LoadOnboardingData event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(status: OnboardingStatus.loading));

    final result = await getOnboardingData();

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

  Future<void> _saveData(OnboardingData data) async {
    try {
      await saveOnboardingData(data);
    } catch (e) {
      debugPrint('Failed to save onboarding data: $e');
    }
  }
}
