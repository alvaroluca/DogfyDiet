import 'package:dogfydiet/app/constants/app_colors.dart';
import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/app/routes/app_path.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_state.dart';
import 'package:dogfydiet/presentation/features/onboarding/steps/breed_selection_step.dart';
import 'package:dogfydiet/presentation/features/onboarding/steps/dog_name_step.dart';
import 'package:dogfydiet/presentation/widgets/custom_button.dart';
import 'package:dogfydiet/presentation/widgets/dogfy_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state.status == OnboardingStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: DogfyAppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.go(AppPaths.home),
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
                      value: 0,
                      minHeight: 4,
                      backgroundColor: Colors.grey.shade300,
                      color: const Color(AppColors.yellowStep),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Expanded(child: DogNameStep()),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomButton(
                          onPressed: () {},
                          text: l10n.onboardingContinue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
