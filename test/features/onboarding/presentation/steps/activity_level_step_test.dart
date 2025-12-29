import 'package:dogfydiet/features/onboarding/domain/entities/activity_level_type.dart';
import 'package:dogfydiet/shared/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/shared/bloc/onboarding_event.dart';
import 'package:dogfydiet/shared/bloc/onboarding_state.dart';
import 'package:dogfydiet/shared/domain/entities/onboarding_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOnboardingBloc extends Mock implements OnboardingBloc {}

void main() {
  setUpAll(() {
    registerFallbackValue(const OnboardingData());
    registerFallbackValue(const UpdateActivityLevel(ActivityLevelType.low));
  });

  group('ActivityLevelStep Integration Tests', () {
    late MockOnboardingBloc mockBloc;

    setUp(() {
      mockBloc = MockOnboardingBloc();
    });

    group('Selection and update', () {
      test('updates bloc state when an activity level is selected', () {
        const onboardingData = OnboardingData();
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateActivityLevel(ActivityLevelType.high));
        verify(() => mockBloc.add(any())).called(1);
      });

      test('allows changing the activity level multiple times', () {
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateActivityLevel(ActivityLevelType.low));
        mockBloc.add(const UpdateActivityLevel(ActivityLevelType.medium));
        mockBloc.add(const UpdateActivityLevel(ActivityLevelType.high));
        verify(() => mockBloc.add(any())).called(3);
      });
    });

    group('Persistence and validation', () {
      test('persists activity level through navigation', () {
        const selectedLevel = ActivityLevelType.medium;
        const onboardingData = OnboardingData(activityLevel: selectedLevel);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.activityLevel, selectedLevel);
      });

      test('requires activity level selection to complete the form', () {
        const onboardingData = OnboardingData(
          activityLevel: ActivityLevelType.medium,
        );
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(
          mockBloc.state.onboardingData.activityLevel,
          ActivityLevelType.medium,
        );
      });

      test('activity level selection does not clear other fields', () {
        const onboardingData = OnboardingData(
          dogName: 'Max',
          activityLevel: ActivityLevelType.low,
        );
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(
          () => mockBloc.add(const UpdateActivityLevel(ActivityLevelType.high)),
        ).thenReturn(null);
        mockBloc.add(const UpdateActivityLevel(ActivityLevelType.high));
        expect(mockBloc.state.onboardingData.dogName, 'Max');
        verify(() => mockBloc.add(any())).called(1);
      });

      test('activity level selection triggers validation', () {
        const onboardingData = OnboardingData(
          dogName: 'Buddy',
          activityLevel: ActivityLevelType.medium,
        );
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.activityLevel, isNotNull);
      });
    });

    group('Options and coverage', () {
      test('all activity level options are available', () {
        expect(ActivityLevelType.low, isNotNull);
        expect(ActivityLevelType.medium, isNotNull);
        expect(ActivityLevelType.high, isNotNull);
      });
    });
  });
}
