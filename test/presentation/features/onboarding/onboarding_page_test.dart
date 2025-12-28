import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_state.dart';
import 'package:dogfydiet/presentation/features/onboarding/onboarding_page.dart';
import 'package:dogfydiet/presentation/features/onboarding/steps/cubit/onboarding_step/onboarding_step_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_test_helper.dart';

class MockOnboardingBloc extends Mock implements OnboardingBloc {
  @override
  Stream<OnboardingState> get stream => Stream.value(const OnboardingState());
}

void main() {
  group('OnboardingPage Widget Tests', () {
    late MockOnboardingBloc mockOnboardingBloc;

    setUp(() {
      mockOnboardingBloc = MockOnboardingBloc();
    });

    group('Smoke & Structure', () {
      testWidgets('renders without error', (WidgetTester tester) async {
        when(
          () => mockOnboardingBloc.state,
        ).thenReturn(const OnboardingState());
        await tester.pumpWidgetWithGoRouter(
          BlocProvider<OnboardingBloc>.value(
            value: mockOnboardingBloc,
            child: BlocProvider<OnboardingStepCubit>(
              create: (_) => OnboardingStepCubit(),
              child: const OnboardingPage(),
            ),
          ),
        );
        expect(find.byType(OnboardingPage), findsOneWidget);
      });

      testWidgets('has scaffold structure', (WidgetTester tester) async {
        when(
          () => mockOnboardingBloc.state,
        ).thenReturn(const OnboardingState());
        await tester.pumpWidgetWithGoRouter(
          BlocProvider<OnboardingBloc>.value(
            value: mockOnboardingBloc,
            child: BlocProvider<OnboardingStepCubit>(
              create: (_) => OnboardingStepCubit(),
              child: const OnboardingPage(),
            ),
          ),
        );
        expect(find.byType(Scaffold), findsWidgets);
      });

      testWidgets('displays app bar', (WidgetTester tester) async {
        when(
          () => mockOnboardingBloc.state,
        ).thenReturn(const OnboardingState());
        await tester.pumpWidgetWithGoRouter(
          BlocProvider<OnboardingBloc>.value(
            value: mockOnboardingBloc,
            child: BlocProvider<OnboardingStepCubit>(
              create: (_) => OnboardingStepCubit(),
              child: const OnboardingPage(),
            ),
          ),
        );
        expect(find.byType(AppBar), findsWidgets);
      });
    });

    group('Layout & Content', () {
      testWidgets('has main layout widgets', (WidgetTester tester) async {
        when(
          () => mockOnboardingBloc.state,
        ).thenReturn(const OnboardingState());
        await tester.pumpWidgetWithGoRouter(
          BlocProvider<OnboardingBloc>.value(
            value: mockOnboardingBloc,
            child: BlocProvider<OnboardingStepCubit>(
              create: (_) => OnboardingStepCubit(),
              child: const OnboardingPage(),
            ),
          ),
        );
        expect(find.byType(Column), findsWidgets);
        expect(find.byType(SafeArea), findsWidgets);
        expect(find.byType(Padding), findsWidgets);
      });

      testWidgets('displays text content', (WidgetTester tester) async {
        when(
          () => mockOnboardingBloc.state,
        ).thenReturn(const OnboardingState());
        await tester.pumpWidgetWithGoRouter(
          BlocProvider<OnboardingBloc>.value(
            value: mockOnboardingBloc,
            child: BlocProvider<OnboardingStepCubit>(
              create: (_) => OnboardingStepCubit(),
              child: const OnboardingPage(),
            ),
          ),
        );
        expect(find.byType(Text), findsWidgets);
      });

      testWidgets('has spacing elements', (WidgetTester tester) async {
        when(
          () => mockOnboardingBloc.state,
        ).thenReturn(const OnboardingState());
        await tester.pumpWidgetWithGoRouter(
          BlocProvider<OnboardingBloc>.value(
            value: mockOnboardingBloc,
            child: BlocProvider<OnboardingStepCubit>(
              create: (_) => OnboardingStepCubit(),
              child: const OnboardingPage(),
            ),
          ),
        );
        expect(find.byType(SizedBox), findsWidgets);
      });
    });

    group('Actions & Interactivity', () {
      testWidgets('has action buttons', (WidgetTester tester) async {
        when(
          () => mockOnboardingBloc.state,
        ).thenReturn(const OnboardingState());
        await tester.pumpWidgetWithGoRouter(
          BlocProvider<OnboardingBloc>.value(
            value: mockOnboardingBloc,
            child: BlocProvider<OnboardingStepCubit>(
              create: (_) => OnboardingStepCubit(),
              child: const OnboardingPage(),
            ),
          ),
        );
        expect(find.byType(ElevatedButton), findsWidgets);
      });
    });

    group('Robustness', () {
      testWidgets('renders without layout errors', (WidgetTester tester) async {
        when(
          () => mockOnboardingBloc.state,
        ).thenReturn(const OnboardingState());
        await tester.pumpWidgetWithGoRouter(
          BlocProvider<OnboardingBloc>.value(
            value: mockOnboardingBloc,
            child: BlocProvider<OnboardingStepCubit>(
              create: (_) => OnboardingStepCubit(),
              child: const OnboardingPage(),
            ),
          ),
        );
        expect(tester.takeException(), isNull);
      });
    });
  });
}
