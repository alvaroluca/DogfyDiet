import 'package:dogfydiet/app/constants/app_colors.dart';
import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/app/routes/app_path.dart';
import 'package:dogfydiet/features/onboarding/presentation/cubit/onboarding_step_cubit.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/activity_level_step.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/birth_date_step.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/breed_selection_step.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/dog_name_step.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/food_profile_step.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/gender_sterilization_step.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/owner_info_step.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/pathologies_step.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/weight_step.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/navigation_button.dart';
import 'package:dogfydiet/shared/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/shared/bloc/onboarding_event.dart';
import 'package:dogfydiet/shared/bloc/onboarding_state.dart';
import 'package:dogfydiet/shared/widgets/dogfy_app_bar.dart';
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
      case 2:
        return const GenderSterilizationStep();
      case 3:
        return const BirthDateStep();
      case 4:
        return const WeightStep();
      case 5:
        return const ActivityLevelStep();
      case 6:
        return const PathologiesStep();
      case 7:
        return const FoodProfileStep();
      case 8:
        return const OwnerInfoStep();
      default:
        return const SizedBox();
    }
  }

  void showExitDialog({
    required BuildContext context,
    required VoidCallback onLeave,
    required VoidCallback onStay,
  }) {
    final l10n = context.l10n;
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.onboardingExitDialogTitle),
        content: Text(l10n.onboardingExitDialogContent),
        actions: [
          TextButton(
            onPressed: onLeave,
            child: Text(l10n.onboardingExitContinueLater),
          ),
          ElevatedButton(
            onPressed: onStay,
            child: Text(l10n.onboardingExitStay),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<OnboardingBloc>();
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state.status == OnboardingStatus.success) {
          context.go(AppPaths.home);
        } else if (state.status == OnboardingStatus.error &&
            state.errorMessage != null &&
            !state.errorMessage!.toLowerCase().contains('location')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.status == OnboardingStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return BlocBuilder<OnboardingStepCubit, int>(
          builder: (context, currentStep) {
            final cubit = context.read<OnboardingStepCubit>();
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: DogfyAppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (currentStep == 0) {
                      showExitDialog(
                        context: context,
                        onLeave: () {
                          context.pop();
                          bloc.add(const OnboardingEvent.resetBreed());
                          context.go(AppPaths.home);
                        },
                        onStay: () => context.pop(),
                      );
                    } else {
                      cubit.previousStep();
                    }
                  },
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 24),
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
                              _getStepWidget(currentStep),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      NavigationButtons(
                        isStepComplete: state.onboardingData.isStepComplete(
                          currentStep,
                        ),
                        isLoading: state.status == OnboardingStatus.submitting,
                        nextButtonText: currentStep == cubit.totalSteps - 1
                            ? l10n.onboardingSubmit
                            : l10n.onboardingContinue,
                        onNext: () {
                          if (currentStep == cubit.totalSteps - 1) {
                            bloc.add(
                              const OnboardingEvent.submitSubscription(),
                            );
                          } else {
                            cubit.nextStep();
                          }
                        },
                      ),
                      const SizedBox(height: 24),
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
