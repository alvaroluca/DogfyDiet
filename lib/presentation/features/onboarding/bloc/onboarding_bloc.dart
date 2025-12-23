import 'package:dogfydiet/app/types/repository_error.dart';
import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/domain/usecases/get_dog_breeds.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final GetDogBreeds getDogBreeds;

  OnboardingBloc({required this.getDogBreeds})
    : super(const OnboardingState()) {
    on<LoadDogBreeds>(_onLoadDogBreeds);
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
}
