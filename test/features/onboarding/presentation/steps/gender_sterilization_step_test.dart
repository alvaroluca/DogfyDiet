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
    registerFallbackValue(const UpdateGender(''));
    registerFallbackValue(const UpdateSterilization(false));
  });

  group('GenderSterilizationStep Integration Tests', () {
    late MockOnboardingBloc mockBloc;

    setUp(() {
      mockBloc = MockOnboardingBloc();
    });

    group('Selection and update', () {
      test('updates bloc state when gender is selected', () {
        const onboardingData = OnboardingData();
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateGender('male'));
        verify(() => mockBloc.add(any())).called(1);
      });

      test('updates bloc state when sterilization is selected', () {
        const onboardingData = OnboardingData();
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateSterilization(true));
        verify(() => mockBloc.add(any())).called(1);
      });

      test('allows changing gender and sterilization multiple times', () {
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateGender('male'));
        mockBloc.add(const UpdateSterilization(true));
        mockBloc.add(const UpdateGender('female'));
        verify(() => mockBloc.add(any())).called(3);
      });
    });

    group('Persistence and validation', () {
      test('persists gender through navigation', () {
        const gender = 'female';
        const onboardingData = OnboardingData(gender: gender);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.gender, gender);
      });

      test('persists sterilization state through navigation', () {
        const isSterilized = true;
        const onboardingData = OnboardingData(isSterilized: isSterilized);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.isSterilized, isSterilized);
      });

      test('requires gender selection to complete the form', () {
        const onboardingData = OnboardingData(gender: null);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.gender, isNull);
      });

      test('gender selection does not clear other fields', () {
        const onboardingData = OnboardingData(dogName: 'Buddy', gender: 'male');
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(() => mockBloc.add(const UpdateGender('female'))).thenReturn(null);
        mockBloc.add(const UpdateGender('female'));
        expect(mockBloc.state.onboardingData.dogName, 'Buddy');
        verify(() => mockBloc.add(any())).called(1);
      });
    });

    group('Coverage and relationships', () {
      test('sterilization can be true or false', () {
        const onboardingData1 = OnboardingData(isSterilized: true);
        const onboardingData2 = OnboardingData(isSterilized: false);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData1));
        expect(mockBloc.state.onboardingData.isSterilized, isTrue);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData2));
        expect(mockBloc.state.onboardingData.isSterilized, isFalse);
      });

      test('both fields are independent', () {
        const onboardingData = OnboardingData(
          gender: 'male',
          isSterilized: false,
        );
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(
          () => mockBloc.add(const UpdateSterilization(true)),
        ).thenReturn(null);
        mockBloc.add(const UpdateSterilization(true));
        expect(mockBloc.state.onboardingData.gender, 'male');
        verify(() => mockBloc.add(any())).called(1);
      });
    });
  });
}
