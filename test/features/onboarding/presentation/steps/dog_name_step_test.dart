import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/get_current_location.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/save_onboarding_data.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/submit_subscription.dart';
import 'package:dogfydiet/shared/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/shared/bloc/onboarding_event.dart';
import 'package:dogfydiet/shared/bloc/onboarding_state.dart';
import 'package:dogfydiet/shared/domain/entities/onboarding_data.dart';
import 'package:dogfydiet/shared/domain/usecases/get_dog_breeds.dart';
import 'package:dogfydiet/shared/domain/usecases/get_onboarding_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetOnboardingData extends Mock implements GetOnboardingData {}

class MockSaveOnboardingData extends Mock implements SaveOnboardingData {}

class MockGetDogBreeds extends Mock implements GetDogBreeds {}

class MockGetCurrentLocation extends Mock implements GetCurrentLocation {}

class MockSubmitSubscription extends Mock implements SubmitSubscription {}

void main() {
  late OnboardingBloc onboardingBloc;
  late MockGetOnboardingData mockGetOnboardingData;
  late MockSaveOnboardingData mockSaveOnboardingData;
  late MockGetDogBreeds mockGetDogBreeds;
  late MockGetCurrentLocation mockGetCurrentLocation;
  late MockSubmitSubscription mockSubmitSubscription;

  setUpAll(() {
    registerFallbackValue(const OnboardingData());
  });

  setUp(() {
    mockGetOnboardingData = MockGetOnboardingData();
    mockSaveOnboardingData = MockSaveOnboardingData();
    mockGetDogBreeds = MockGetDogBreeds();
    mockGetCurrentLocation = MockGetCurrentLocation();
    mockSubmitSubscription = MockSubmitSubscription();

    when(
      () => mockSaveOnboardingData(any()),
    ).thenAnswer((_) async => const Result.success(true));

    onboardingBloc = OnboardingBloc(
      getOnboardingData: mockGetOnboardingData,
      saveOnboardingData: mockSaveOnboardingData,
      getDogBreeds: mockGetDogBreeds,
      getCurrentLocation: mockGetCurrentLocation,
      submitSubscription: mockSubmitSubscription,
    );
  });

  tearDown(() {
    onboardingBloc.close();
  });

  group('DogNameStep Form Integration Tests', () {
    group('Update and edit', () {
      test('updates bloc state when dog name is changed', () async {
        onboardingBloc.add(const UpdateDogName('Buddy'));
        await Future.delayed(const Duration(milliseconds: 100));
        expect(onboardingBloc.state.onboardingData.dogName, 'Buddy');
        verify(() => mockSaveOnboardingData(any())).called(greaterThan(0));
      });

      test('allows editing the dog name multiple times', () async {
        onboardingBloc.add(const UpdateDogName('First'));
        await Future.delayed(const Duration(milliseconds: 50));
        onboardingBloc.add(const UpdateDogName('Second'));
        await Future.delayed(const Duration(milliseconds: 50));
        onboardingBloc.add(const UpdateDogName('Final'));
        await Future.delayed(const Duration(milliseconds: 100));
        expect(onboardingBloc.state.onboardingData.dogName, 'Final');
      });

      test('handles empty input correctly', () async {
        onboardingBloc.add(const UpdateDogName(''));
        await Future.delayed(const Duration(milliseconds: 100));
        expect(onboardingBloc.state.onboardingData.dogName, '');
      });
    });

    group('Persistence and navigation', () {
      test('persists dog name through navigation', () async {
        onboardingBloc.add(const UpdateDogName('Luna'));
        await Future.delayed(const Duration(milliseconds: 100));
        onboardingBloc.emit(
          OnboardingState(
            onboardingData: onboardingBloc.state.onboardingData.copyWith(),
          ),
        );
        await Future.delayed(const Duration(milliseconds: 100));
        expect(onboardingBloc.state.onboardingData.dogName, 'Luna');
      });

      test(
        'form step retains data after returning from another step',
        () async {
          onboardingBloc.add(const UpdateDogName('Buddy'));
          await Future.delayed(const Duration(milliseconds: 100));
          expect(onboardingBloc.state.onboardingData.dogName, 'Buddy');
          // Simula ir adelante y volver atrás
          onboardingBloc.emit(
            OnboardingState(
              onboardingData: onboardingBloc.state.onboardingData.copyWith(),
            ),
          );
          onboardingBloc.emit(
            OnboardingState(
              onboardingData: onboardingBloc.state.onboardingData.copyWith(),
            ),
          );
          expect(onboardingBloc.state.onboardingData.dogName, 'Buddy');
        },
      );
    });
  });
}
