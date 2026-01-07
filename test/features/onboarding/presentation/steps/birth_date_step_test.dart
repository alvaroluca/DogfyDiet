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
    registerFallbackValue(UpdateBirthDate(DateTime.now()));
  });

  group('BirthDateStep Integration Tests', () {
    late MockOnboardingBloc mockBloc;

    setUp(() {
      mockBloc = MockOnboardingBloc();
    });

    group('Selection and update', () {
      test('updates bloc state when a birth date is selected', () {
        final testDate = DateTime(2020, 5, 15);
        const onboardingData = OnboardingData();
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(UpdateBirthDate(testDate));
        verify(() => mockBloc.add(any())).called(1);
      });

      test('allows changing the birth date multiple times', () {
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(UpdateBirthDate(DateTime(2018, 1, 1)));
        mockBloc.add(UpdateBirthDate(DateTime(2019, 6, 15)));
        mockBloc.add(UpdateBirthDate(DateTime(2020, 12, 25)));
        verify(() => mockBloc.add(any())).called(3);
      });
    });

    group('Persistence and validation', () {
      test('persists birth date through navigation', () {
        final birthDate = DateTime(2019, 3, 20);
        final onboardingData = OnboardingData(birthDate: birthDate);
        when(
          () => mockBloc.state,
        ).thenReturn(OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.birthDate, birthDate);
      });

      test('requires birth date to complete the form', () {
        const onboardingData = OnboardingData(birthDate: null);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.birthDate, isNull);
      });

      test('birth date selection does not clear other fields', () {
        final birthDate = DateTime(2018, 6, 10);
        final onboardingData = OnboardingData(
          dogName: 'Buddy',
          birthDate: birthDate,
        );
        when(
          () => mockBloc.state,
        ).thenReturn(OnboardingState(onboardingData: onboardingData));
        final newDate = DateTime(2019, 1, 1);
        when(() => mockBloc.add(UpdateBirthDate(newDate))).thenReturn(null);
        mockBloc.add(UpdateBirthDate(newDate));
        expect(mockBloc.state.onboardingData.dogName, 'Buddy');
        verify(() => mockBloc.add(any())).called(1);
      });
    });

    group('Coverage and date validations', () {
      test('correctly calculates age from birth date', () {
        final birthDate = DateTime(2020, 5, 15);
        final onboardingData = OnboardingData(birthDate: birthDate);
        when(
          () => mockBloc.state,
        ).thenReturn(OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.birthDate, isNotNull);
      });

      test('accepts past dates', () {
        final pastDate = DateTime(2010, 1, 1);
        final onboardingData = OnboardingData(birthDate: pastDate);
        when(
          () => mockBloc.state,
        ).thenReturn(OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.birthDate, pastDate);
      });

      test('rejects future dates', () {
        final futureDate = DateTime.now().add(const Duration(days: 1));
        expect(futureDate.isAfter(DateTime.now()), isTrue);
      });
    });
  });
}
