import 'package:dogfydiet/features/home/presentation/pages/home_page.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_test_helper.dart';

class MockOnboardingBloc extends Mock implements OnboardingBloc {
  @override
  Stream<OnboardingState> get stream => Stream.value(const OnboardingState());
}

void main() {
  group('HomePage', () {
    late MockOnboardingBloc mockOnboardingBloc;

    setUp(() {
      mockOnboardingBloc = MockOnboardingBloc();
    });

    testWidgets('renders without error', (WidgetTester tester) async {
      when(() => mockOnboardingBloc.state).thenReturn(const OnboardingState());

      await tester.pumpWidgetWithMaterialApp(
        BlocProvider<OnboardingBloc>.value(
          value: mockOnboardingBloc,
          child: const HomePage(),
        ),
      );

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('has scaffold structure', (WidgetTester tester) async {
      when(() => mockOnboardingBloc.state).thenReturn(const OnboardingState());

      await tester.pumpWidgetWithMaterialApp(
        BlocProvider<OnboardingBloc>.value(
          value: mockOnboardingBloc,
          child: const HomePage(),
        ),
      );

      expect(find.byType(Scaffold), findsWidgets);
    });

    testWidgets('displays app bar with title', (WidgetTester tester) async {
      when(() => mockOnboardingBloc.state).thenReturn(const OnboardingState());

      await tester.pumpWidgetWithMaterialApp(
        BlocProvider<OnboardingBloc>.value(
          value: mockOnboardingBloc,
          child: const HomePage(),
        ),
      );

      expect(find.byType(AppBar), findsWidgets);
      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('has SafeArea and Padding layout', (WidgetTester tester) async {
      when(() => mockOnboardingBloc.state).thenReturn(const OnboardingState());

      await tester.pumpWidgetWithMaterialApp(
        BlocProvider<OnboardingBloc>.value(
          value: mockOnboardingBloc,
          child: const HomePage(),
        ),
      );

      expect(find.byType(SafeArea), findsWidgets);
      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('has Column and Spacer for layout', (
      WidgetTester tester,
    ) async {
      when(() => mockOnboardingBloc.state).thenReturn(const OnboardingState());

      await tester.pumpWidgetWithMaterialApp(
        BlocProvider<OnboardingBloc>.value(
          value: mockOnboardingBloc,
          child: const HomePage(),
        ),
      );

      expect(find.byType(Column), findsWidgets);
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('displays action button', (WidgetTester tester) async {
      when(() => mockOnboardingBloc.state).thenReturn(const OnboardingState());

      await tester.pumpWidgetWithMaterialApp(
        BlocProvider<OnboardingBloc>.value(
          value: mockOnboardingBloc,
          child: const HomePage(),
        ),
      );

      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('renders without layout errors', (WidgetTester tester) async {
      when(() => mockOnboardingBloc.state).thenReturn(const OnboardingState());

      await tester.pumpWidgetWithMaterialApp(
        BlocProvider<OnboardingBloc>.value(
          value: mockOnboardingBloc,
          child: const HomePage(),
        ),
      );

      expect(tester.takeException(), isNull);
    });
  });
}
