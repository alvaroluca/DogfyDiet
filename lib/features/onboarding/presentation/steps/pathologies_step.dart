import 'package:dogfydiet/core/constants/app_assets.dart';
import 'package:dogfydiet/core/l10n/l10n.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/custom_choice_chip.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/onboarding_circle_image.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/onboarding_info_box.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/onboarding_step_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PathologiesStep extends StatelessWidget {
  const PathologiesStep({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<OnboardingBloc>();
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final dogName = state.onboardingData.dogName ?? '';
        final hasPathologies = state.onboardingData.hasPathologies;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              const OnboardingCircleImage(imageAsset: AppAssets.corazon),
              const SizedBox(height: 16),
              OnboardingStepHeader(title: l10n.pathologiesTitle(dogName)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomChoiceChip(
                    label: l10n.commonYes,
                    selected: hasPathologies == true,
                    position: 0,
                    onTap: () => bloc.add(
                      const OnboardingEvent.updateHasPathologies(true),
                    ),
                  ),
                  CustomChoiceChip(
                    label: l10n.commonNo,
                    selected: hasPathologies == false,
                    position: 1,
                    onTap: () => bloc.add(
                      const OnboardingEvent.updateHasPathologies(false),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              OnboardingInfoBox(title: l10n.pathologiesInfoBox),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}
