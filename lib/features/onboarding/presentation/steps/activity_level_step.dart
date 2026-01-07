import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/features/onboarding/domain/entities/activity_level_type.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/onboarding_step_section.dart';
import 'package:dogfydiet/shared/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/shared/bloc/onboarding_event.dart';
import 'package:dogfydiet/shared/bloc/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OnboardingStepSection<ActivityLevelType>(
                title: l10n.activityLevelTitle(dogName),
                subtitle: l10n.activityLevelSubtitle,
                options: options,
                selectedIndex: selectedIndex,
                onTap: (option) {
                  bloc.add(OnboardingEvent.updateActivityLevel(option));
                },
                assetBuilder: (option) => option.asset,
                description: options[selectedIndex].description(l10n),
              ),
            ],
          ),
        );
      },
    );
  }
}
