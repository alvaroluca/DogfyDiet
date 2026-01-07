import 'package:dogfydiet/core/constants/app_assets.dart';
import 'package:dogfydiet/core/l10n/l10n.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/onboarding_circle_image.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/onboarding_info_box.dart';
import 'package:dogfydiet/features/onboarding/presentation/widgets/onboarding_step_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/owner_info/owner_info_cubit.dart';

class OwnerInfoStep extends StatelessWidget {
  const OwnerInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<OnboardingBloc>();
    return BlocProvider<OwnerInfoCubit>(
      create: (context) => OwnerInfoCubit(
        initialName: bloc.state.onboardingData.ownerName,
        initialLocation: bloc.state.onboardingData.location,
        onNameChanged: (value) =>
            bloc.add(OnboardingEvent.updateOwnerName(value)),
        onLocationChanged: (value) =>
            bloc.add(OnboardingEvent.updateLocation(value)),
      ),
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listenWhen: (previous, current) =>
            previous.onboardingData.location != current.onboardingData.location,
        listener: (context, state) {
          final cubit = context.read<OwnerInfoCubit>();
          final location = state.onboardingData.location ?? '';
          cubit.setLocation(location);
        },
        buildWhen: (previous, current) =>
            previous.onboardingData.ownerName !=
                current.onboardingData.ownerName ||
            previous.onboardingData.location !=
                current.onboardingData.location ||
            previous.isLocationLoading != current.isLocationLoading ||
            previous.errorMessage != current.errorMessage,
        builder: (context, state) {
          final cubit = context.read<OwnerInfoCubit>();
          final dogName = state.onboardingData.dogName ?? '';

          return SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                const OnboardingCircleImage(imageAsset: AppAssets.dedo),
                const SizedBox(height: 16),
                OnboardingStepHeader(title: l10n.ownerInfoTitle(dogName)),
                TextField(
                  controller: cubit.nameController,
                  decoration: InputDecoration(
                    labelText: l10n.ownerNameLabel,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: cubit.locationController,
                  decoration: InputDecoration(
                    labelText: l10n.ownerLocationLabel,
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: state.isLocationLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.my_location),
                      onPressed: state.isLocationLoading
                          ? null
                          : () =>
                                bloc.add(const OnboardingEvent.fetchLocation()),
                    ),
                  ),
                  enabled: !state.isLocationLoading,
                ),
                const SizedBox(height: 8),
                if (state.errorMessage != null &&
                    state.errorMessage!.toLowerCase().contains('location'))
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '${l10n.ownerLocationPermissionDeniedTitle}: ${l10n.ownerLocationPermissionDeniedDialog}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 12,
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                OnboardingInfoBox(title: l10n.ownerInfoInfoBox),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
