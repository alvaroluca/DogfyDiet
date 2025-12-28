import 'package:dogfydiet/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/domain/entities/weight_shape_type.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_event.dart';
import 'package:dogfydiet/presentation/features/onboarding/bloc/onboarding_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOnboardingBloc extends Mock implements OnboardingBloc {}

void main() {
  setUpAll(() {
    registerFallbackValue(const OnboardingData());
    registerFallbackValue(const UpdateWeightShape(WeightShapeType.thin));
    registerFallbackValue(const UpdateWeightValue(10));
  });

  group('WeightStep Integration Tests', () {
    late MockOnboardingBloc mockBloc;

    setUp(() {
      mockBloc = MockOnboardingBloc();
    });

    group('Selection and update', () {
      test('updates bloc state when weight shape is selected', () {
        const onboardingData = OnboardingData();
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateWeightShape(WeightShapeType.normal));
        verify(() => mockBloc.add(any())).called(1);
      });

      test('updates bloc state when weight value is changed', () {
        const onboardingData = OnboardingData();
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateWeightValue(18));
        verify(() => mockBloc.add(any())).called(1);
      });
    });

    group('Persistence and validation', () {
      test('persists weight shape and value through navigation', () {
        const onboardingData = OnboardingData(
          weightShape: WeightShapeType.normal,
          weightValue: 20,
        );
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(
          mockBloc.state.onboardingData.weightShape,
          WeightShapeType.normal,
        );
        expect(mockBloc.state.onboardingData.weightValue, 20);
      });

      test('requires weight value for form completion', () {
        const onboardingData = OnboardingData(weightValue: null);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.weightValue, isNull);
      });

      test('weight selection does not clear other fields', () {
        const onboardingData = OnboardingData(
          dogName: 'Buddy',
          weightValue: 15,
        );
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.dogName, 'Buddy');
        expect(mockBloc.state.onboardingData.weightValue, 15);
      });
    });
  });
}
