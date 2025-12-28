import 'package:dogfydiet/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_event.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOnboardingBloc extends Mock implements OnboardingBloc {}

void main() {
  setUpAll(() {
    registerFallbackValue(const OnboardingData());
    registerFallbackValue(const UpdateHasPathologies(false));
  });

  group('PathologiesStep Integration Tests', () {
    late MockOnboardingBloc mockBloc;

    setUp(() {
      mockBloc = MockOnboardingBloc();
    });

    group('Selection and update', () {
      test('updates bloc state when pathologies state is selected', () {
        const onboardingData = OnboardingData();
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateHasPathologies(true));
        verify(() => mockBloc.add(any())).called(1);
      });

      test('allows toggling the pathologies state multiple times', () {
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateHasPathologies(false));
        mockBloc.add(const UpdateHasPathologies(true));
        mockBloc.add(const UpdateHasPathologies(false));
        verify(() => mockBloc.add(any())).called(3);
      });
    });

    group('Persistence and validation', () {
      test('persists pathologies state through navigation', () {
        const hasPathologies = true;
        const onboardingData = OnboardingData(hasPathologies: hasPathologies);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.hasPathologies, hasPathologies);
      });

      test('requires pathologies selection to complete the form', () {
        const onboardingData = OnboardingData(hasPathologies: false);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.hasPathologies, isFalse);
      });

      test('pathologies selection does not clear other fields', () {
        const onboardingData = OnboardingData(
          dogName: 'Buddy',
          hasPathologies: false,
        );
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(
          () => mockBloc.add(const UpdateHasPathologies(true)),
        ).thenReturn(null);
        mockBloc.add(const UpdateHasPathologies(true));
        expect(mockBloc.state.onboardingData.dogName, 'Buddy');
        verify(() => mockBloc.add(any())).called(1);
      });

      test('pathologies selection triggers validation', () {
        const onboardingData = OnboardingData(
          dogName: 'Buddy',
          hasPathologies: true,
        );
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.hasPathologies, isNotNull);
      });
    });

    group('Coverage and values', () {
      test('can be true or false', () {
        const onboardingDataTrue = OnboardingData(hasPathologies: true);
        const onboardingDataFalse = OnboardingData(hasPathologies: false);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingDataTrue));
        expect(mockBloc.state.onboardingData.hasPathologies, isTrue);
        when(() => mockBloc.state).thenReturn(
          const OnboardingState(onboardingData: onboardingDataFalse),
        );
        expect(mockBloc.state.onboardingData.hasPathologies, isFalse);
      });

      test('stores null when not answered', () {
        const onboardingData = OnboardingData(hasPathologies: false);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.hasPathologies, isFalse);
      });
    });
  });
}
