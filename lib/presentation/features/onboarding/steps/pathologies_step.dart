import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_event.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_state.dart';
import 'package:dogfydiet/presentation/widgets/custom_choice_chips.dart';
import 'package:dogfydiet/presentation/widgets/onboarding_info_box.dart';
import 'package:dogfydiet/presentation/widgets/onboarding_step_header.dart';
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

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            OnboardingStepHeader(title: l10n.pathologiesTitle(dogName)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomChoiceChip(
                  label: l10n.commonYes,
                  selected: hasPathologies == true,
                  position: 0,
                  onTap: () {
                    bloc.add(const OnboardingEvent.updateHasPathologies(true));
                  },
                ),
                CustomChoiceChip(
                  label: l10n.commonNo,
                  selected: hasPathologies == false,
                  position: 1,
                  onTap: () {
                    bloc.add(const OnboardingEvent.updateHasPathologies(false));
                  },
                ),
              ],
            ),
            const Spacer(),
            OnboardingInfoBox(title: l10n.pathologiesInfoBox),
          ],
        );
      },
    );
  }
}
