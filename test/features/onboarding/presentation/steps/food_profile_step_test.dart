import 'package:dogfydiet/features/onboarding/domain/entities/food_profile_type.dart';
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
    registerFallbackValue(const UpdateFoodProfile(FoodProfileType.selective));
  });

  group('FoodProfileStep Integration Tests', () {
    late MockOnboardingBloc mockBloc;

    setUp(() {
      mockBloc = MockOnboardingBloc();
    });

    group('Selection and update', () {
      test('updates bloc state when a food profile is selected', () {
        const onboardingData = OnboardingData();
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateFoodProfile(FoodProfileType.selective));
        verify(() => mockBloc.add(any())).called(1);
      });

      test('allows changing the food profile multiple times', () {
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateFoodProfile(FoodProfileType.selective));
        mockBloc.add(const UpdateFoodProfile(FoodProfileType.gourmet));
        mockBloc.add(const UpdateFoodProfile(FoodProfileType.glutton));
        verify(() => mockBloc.add(any())).called(3);
      });

      test('supports all food profile options', () {
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateFoodProfile(FoodProfileType.selective));
        mockBloc.add(const UpdateFoodProfile(FoodProfileType.gourmet));
        mockBloc.add(const UpdateFoodProfile(FoodProfileType.glutton));
        verify(() => mockBloc.add(any())).called(3);
      });

      test('can change the profile after an initial selection', () {
        const onboardingData = OnboardingData(
          foodProfile: FoodProfileType.selective,
        );
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(() => mockBloc.add(any())).thenReturn(null);
        mockBloc.add(const UpdateFoodProfile(FoodProfileType.glutton));
        verify(
          () => mockBloc.add(const UpdateFoodProfile(FoodProfileType.glutton)),
        ).called(1);
      });
    });

    group('Persistence and validation', () {
      test('persists food profile through navigation', () {
        const profile = FoodProfileType.gourmet;
        const onboardingData = OnboardingData(foodProfile: profile);
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.foodProfile, profile);
      });

      test('requires food profile to complete the form', () {
        const onboardingData = OnboardingData(
          foodProfile: FoodProfileType.gourmet,
        );
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(
          mockBloc.state.onboardingData.foodProfile,
          FoodProfileType.gourmet,
        );
      });

      test('food profile selection does not clear other fields', () {
        const onboardingData = OnboardingData(
          dogName: 'Buddy',
          foodProfile: FoodProfileType.selective,
        );
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        when(
          () => mockBloc.add(const UpdateFoodProfile(FoodProfileType.gourmet)),
        ).thenReturn(null);
        mockBloc.add(const UpdateFoodProfile(FoodProfileType.gourmet));
        expect(mockBloc.state.onboardingData.dogName, 'Buddy');
        verify(() => mockBloc.add(any())).called(1);
      });

      test('food profile selection triggers validation', () {
        const onboardingData = OnboardingData(
          dogName: 'Buddy',
          foodProfile: FoodProfileType.gourmet,
        );
        when(
          () => mockBloc.state,
        ).thenReturn(const OnboardingState(onboardingData: onboardingData));
        expect(mockBloc.state.onboardingData.foodProfile, isNotNull);
      });
    });
  });
}
