import 'package:dogfydiet/app/constants/app_colors.dart';
import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/app/routes/app_path.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_state.dart';
import 'package:dogfydiet/presentation/features/onboarding/steps/breed_selection_step.dart';
import 'package:dogfydiet/presentation/features/onboarding/steps/cubit/onboarding_step/onboarding_step_cubit.dart';
import 'package:dogfydiet/presentation/features/onboarding/steps/dog_name_step.dart';
import 'package:dogfydiet/presentation/widgets/dogfy_app_bar.dart';
import 'package:dogfydiet/presentation/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  Widget _getStepWidget(int step) {
    switch (step) {
      case 0:
        return const BreedSelectionStep();
      case 1:
        return const DogNameStep();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state.status == OnboardingStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return BlocBuilder<OnboardingStepCubit, int>(
          builder: (context, currentStep) {
            final cubit = context.read<OnboardingStepCubit>();
            return Scaffold(
              appBar: DogfyAppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () async {
                    if (currentStep == 0) {
                      context.go(AppPaths.home);
                    } else {
                      cubit.previousStep();
                    }
                  },
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: (currentStep + 1) / cubit.totalSteps,
                          minHeight: 4,
                          backgroundColor: Colors.grey.shade300,
                          color: const Color(AppColors.yellowStep),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Expanded(child: _getStepWidget(currentStep)),
                      const SizedBox(height: 24),
                      NavigationButtons(
                        isStepComplete: state.onboardingData.isStepComplete(
                          currentStep,
                        ),
                        isLoading: state.status == OnboardingStatus.submitting,
                        nextButtonText: l10n.onboardingContinue,
                        onNext: () => cubit.nextStep(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
