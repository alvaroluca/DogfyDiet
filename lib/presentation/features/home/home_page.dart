import 'package:dogfydiet/app/constants/app_assets.dart';
import 'package:dogfydiet/app/l10n/l10n.dart';
import 'package:dogfydiet/app/routes/app_path.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_event.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_state.dart';
import 'package:dogfydiet/presentation/widgets/custom_button.dart';
import 'package:dogfydiet/presentation/widgets/custom_dropdown.dart';
import 'package:dogfydiet/presentation/widgets/dogfy_app_bar.dart';
import 'package:dogfydiet/presentation/widgets/lottie_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<OnboardingBloc>();
    return Scaffold(
      appBar: const DogfyAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.homeTitle,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.homeSubtitle,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<OnboardingBloc, OnboardingState>(
                    builder: (context, state) {
                      if (state.dogBreeds.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return CustomDropdown<int>(
                        value: state.onboardingData.breedId,
                        labelText: l10n.homeBreedLabel,
                        isRounded: true,
                        items: state.dogBreeds
                            .map(
                              (breed) => DropdownMenuItem<int>(
                                value: breed.id,
                                child: Text(breed.name),
                              ),
                            )
                            .toList(),
                        onChanged: (id) {
                          if (id != null) {
                            bloc.add(OnboardingEvent.updateBreed(id));
                          }
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 24),
                  const Expanded(
                    child: Center(
                      child: LottieCustom(
                        assetName: AppAssets.dogHome,
                        height: 300,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      onPressed: () {
                        if (bloc.state.onboardingData.breedId == null) {
                          // No breed selected - Step 0
                          context.go(AppPaths.onboarding, extra: 0);
                        } else {
                          // Breed selected - Step 1
                          context.go(AppPaths.onboarding, extra: 1);
                        }
                      },
                      text: l10n.homeCta,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
