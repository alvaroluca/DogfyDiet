import 'package:dogfydiet/app/constants/app_assets.dart';
import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/cubit/birth_date/birth_date_cubit.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/cubit/birth_date/birth_date_state.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/onboarding_circle_image.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/onboarding_info_box.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/onboarding_step_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BirthDateStep extends StatelessWidget {
  const BirthDateStep({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<OnboardingBloc>();
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, onboardingState) {
        return BlocProvider(
          create: (_) => BirthDateCubit(
            initialBirthDate: onboardingState.onboardingData.birthDate,
          ),
          child: BlocBuilder<BirthDateCubit, BirthDateState>(
            builder: (context, state) {
              void updateDate(int year, int month) {
                context.read<BirthDateCubit>().updateDate(year, month);
                final newDate = DateTime(year, month, 1);
                bloc.add(OnboardingEvent.updateBirthDate(newDate));
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 8),
                    const OnboardingCircleImage(imageAsset: AppAssets.tarta),
                    const SizedBox(height: 16),
                    OnboardingStepHeader(
                      title: l10n.birthDateTitle(
                        onboardingState.onboardingData.dogName ?? '',
                      ),
                    ),
                    DropdownButtonFormField<int?>(
                      value: state.selectedYear,
                      decoration: InputDecoration(
                        labelText: l10n.birthDateYearLabel,
                        border: const OutlineInputBorder(),
                      ),
                      items: state.years
                          .map(
                            (year) => DropdownMenuItem<int?>(
                              value: year,
                              child: Text(year.toString()),
                            ),
                          )
                          .toList(),
                      onChanged: (year) {
                        context.read<BirthDateCubit>().updateYear(year);
                        final month = state.selectedMonth;
                        if (year != null && month != null) {
                          updateDate(year, month);
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<int?>(
                      value: state.selectedMonth,
                      decoration: InputDecoration(
                        labelText: l10n.birthDateMonthLabel,
                        border: const OutlineInputBorder(),
                      ),
                      items: state.months
                          .map(
                            (month) => DropdownMenuItem<int?>(
                              value: month,
                              child: Text(month.toString().padLeft(2, '0')),
                            ),
                          )
                          .toList(),
                      onChanged: (month) {
                        final year = state.selectedYear ?? DateTime.now().year;
                        context.read<BirthDateCubit>().updateMonth(month);
                        if (month != null) {
                          updateDate(year, month);
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    OnboardingInfoBox(title: l10n.birthDateInfoBox),
                    const SizedBox(height: 24),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
