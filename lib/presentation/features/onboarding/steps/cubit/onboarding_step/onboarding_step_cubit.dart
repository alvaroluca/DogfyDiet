import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingStepCubit extends Cubit<int> {
  final int totalSteps = 8;
  OnboardingStepCubit({int initialStep = 0}) : super(initialStep);

  void nextStep() {
    if (state < totalSteps - 1) emit(state + 1);
  }

  void previousStep() {
    if (state > 0) emit(state - 1);
  }

  bool get canGoPrevious => state > 0;
}
