import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/domain/entities/activity_level_type.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_event.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_state.dart';
import 'package:dogfydiet/presentation/widgets/onboarding_step_header.dart';
import 'package:dogfydiet/presentation/widgets/step_progress_with_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivityLevelStep extends StatelessWidget {
  const ActivityLevelStep({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<OnboardingBloc>();
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final dogName = state.onboardingData.dogName ?? '';
        final selectedIndex = state.onboardingData.activityLevel.index;
        const options = ActivityLevelType.values;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OnboardingStepHeader(
                  title: l10n.activityLevelTitle(dogName),
                  subtitle: l10n.activityLevelSubtitle,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(options.length, (i) {
                    final option = options[i];
                    final isSelected = selectedIndex == i;
                    return GestureDetector(
                      onTap: () =>
                          bloc.add(OnboardingEvent.updateActivityLevel(option)),
                      child: Opacity(
                        opacity: isSelected ? 1.0 : 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: SvgPicture.asset(option.asset, height: 90),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 24),
                StepProgressWithCircle(
                  selectedIndex: selectedIndex,
                  steps: 3,
                  circleSize: 30,
                  height: 44,
                  topOffset: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
                  child: Text(
                    options[selectedIndex].description(l10n),
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
