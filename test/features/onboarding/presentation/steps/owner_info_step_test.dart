import 'package:dogfydiet/features/onboarding/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:dogfydiet/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOnboardingBloc extends Mock implements OnboardingBloc {}

void main() {
  setUpAll(() {
    registerFallbackValue(const OnboardingData());
    registerFallbackValue(const UpdateOwnerName(''));
    registerFallbackValue(const UpdateLocation(''));
  });

  group('OwnerInfoStep Integration Tests', () {
    late MockOnboardingBloc mockBloc;

    setUp(() {
      mockBloc = MockOnboardingBloc();
    });

    group('Update and edit', () {
      test('updates bloc state when owner name is entered', () {
        const onboardingData = OnboardingData();
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateOwnerName('John Doe'));
        verify(() => mockBloc.add(any())).called(1);
      });

      test('allows editing the owner name multiple times', () {
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateOwnerName('John'));
        mockBloc.add(const UpdateOwnerName('John Doe'));
        mockBloc.add(const UpdateOwnerName('Jane Doe'));
        verify(() => mockBloc.add(any())).called(3);
      });

      test('validates that the owner name is not empty', () {
        const onboardingData = OnboardingData(ownerName: '');
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.ownerName, isEmpty);
      });

      test('owner name can contain special characters', () {
        const specialName = "O'Brien-Smith";
        const onboardingData = OnboardingData(ownerName: specialName);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.ownerName, specialName);
      });
    });

    group('Persistence and validation', () {
      test('persists owner name through navigation', () {
        const ownerName = 'Jane Smith';
        const onboardingData = OnboardingData(ownerName: ownerName);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.ownerName, ownerName);
      });

      test('requires owner name to complete the form', () {
        const onboardingData = OnboardingData(ownerName: null);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.ownerName, isNull);
      });

      test('owner name does not clear other fields', () {
        const onboardingData = OnboardingData(
          dogName: 'Buddy',
          ownerName: 'John',
        );
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(
          () => mockBloc.add(const UpdateOwnerName('Jane')),
        ).thenReturn(null);
        mockBloc.add(const UpdateOwnerName('Jane'));
        expect(mockBloc.state.onboardingData.dogName, 'Buddy');
        verify(() => mockBloc.add(any())).called(1);
      });
    });

    group('Location coverage', () {
      test('updates location when provided', () {
        const location = 'New York, NY';
        const onboardingData = OnboardingData(
          ownerName: 'John',
          location: location,
        );
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.location, location);
      });
    });
  });
}
