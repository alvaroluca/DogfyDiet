import 'package:dogfydiet/app/di/di.dart' as di;
import 'package:dogfydiet/app/routes/app_path.dart';
import 'package:dogfydiet/presentation/features/home/home_page.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_event.dart';
import 'package:dogfydiet/presentation/features/onboarding/onboarding_page.dart';
import 'package:dogfydiet/presentation/features/onboarding/steps/cubit/onboarding_step/onboarding_step_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final appRoutes = <RouteBase>[
  GoRoute(
    path: AppPaths.home,
    builder: (context, state) => BlocProvider<OnboardingBloc>(
      create: (_) => di.getIt<OnboardingBloc>()
        ..add(const OnboardingEvent.loadDogBreeds())
        ..add(const OnboardingEvent.loadOnboardingData()),
      child: const HomePage(),
    ),
  ),
  GoRoute(
    path: AppPaths.onboarding,
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(
          create: (_) => di.getIt<OnboardingBloc>()
            ..add(const OnboardingEvent.loadOnboardingData())
            ..add(const OnboardingEvent.loadDogBreeds()),
        ),
        BlocProvider<OnboardingStepCubit>(
          create: (_) => OnboardingStepCubit(
            initialStep: state.extra is int ? state.extra as int : 0,
          ),
        ),
      ],
      child: const OnboardingPage(),
    ),
  ),
];
