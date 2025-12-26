import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/domain/entities/weight_shape_type.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_event.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_state.dart';
import 'package:dogfydiet/presentation/widgets/onboarding_step_header.dart';
import 'package:dogfydiet/presentation/widgets/step_progress_with_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cubit/weight/weight_cubit.dart';

class WeightStep extends StatelessWidget {
  const WeightStep({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<OnboardingBloc>();
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final dogName = state.onboardingData.dogName ?? '';
        final selectedIndex = state.onboardingData.weightShape.index;
        const options = WeightShapeType.values;
        final weight =
            state.onboardingData.weightValue ??
            options[selectedIndex].defaultWeight;
        return BlocProvider<WeightCubit>(
          create: (_) => WeightCubit(
            weight: weight,
            onChanged: (value) {
              if (value > 0) {
                bloc.add(OnboardingEvent.updateWeightValue(value));
              } else {
                bloc.add(const OnboardingEvent.updateWeightValue(-1));
              }
            },
          ),
          child: BlocBuilder<WeightCubit, double>(
            builder: (context, value) {
              final cubit = context.read<WeightCubit>();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OnboardingStepHeader(
                        title: l10n.weightStepTitle(dogName),
                        subtitle: l10n.weightStepSubtitle,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(options.length, (i) {
                          final option = options[i];
                          final isSelected = selectedIndex == i;
                          return GestureDetector(
                            onTap: () {
                              bloc.add(
                                OnboardingEvent.updateWeightShape(option),
                              );
                              final defaultWeight = option.defaultWeight;
                              cubit.setWeight(defaultWeight);
                            },
                            child: Opacity(
                              opacity: isSelected ? 1.0 : 0.5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SvgPicture.asset(
                                    option.asset,
                                    height: 90,
                                  ),
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

                  ///////
                  const SizedBox(height: 24),
                  Text(l10n.weightStepBottomText(dogName)),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: cubit.controller,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffix: Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text(
                            l10n.weightStepKg,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
