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
    registerFallbackValue(const UpdateBreed(1));
  });

  group('BreedSelectionStep Integration Tests', () {
    late MockOnboardingBloc mockBloc;

    setUp(() {
      mockBloc = MockOnboardingBloc();
    });

    group('Selection and update', () {
      test('updates bloc state when a breed is selected', () {
        const onboardingData = OnboardingData();
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateBreed(2));
        verify(() => mockBloc.add(any())).called(1);
      });

      test('allows changing the breed multiple times', () {
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateBreed(1));
        mockBloc.add(const UpdateBreed(2));
        mockBloc.add(const UpdateBreed(3));
        verify(() => mockBloc.add(any())).called(3);
      });
    });

    group('Persistence and validation', () {
      test('persists breed selection through navigation', () {
        const selectedBreedId = 5;
        const onboardingData = OnboardingData(breedId: selectedBreedId);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.breedId, selectedBreedId);
      });

      test('requires breed selection to complete the form', () {
        const onboardingData = OnboardingData(breedId: null);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.breedId, isNull);
      });

      test('breed selection does not clear other fields', () {
        const onboardingData = OnboardingData(dogName: 'Buddy', breedId: 1);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(() => mockBloc.add(const UpdateBreed(3))).thenReturn(null);
        mockBloc.add(const UpdateBreed(3));
        expect(mockBloc.state.onboardingData.dogName, 'Buddy');
        verify(() => mockBloc.add(const UpdateBreed(3))).called(1);
      });
    });
  });
}
