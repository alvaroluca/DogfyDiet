import 'package:dogfydiet/app/di/di.dart' as di;
import 'package:dogfydiet/app/routes/app_path.dart';
import 'package:dogfydiet/presentation/features/home/home_page.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_event.dart';
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
];
