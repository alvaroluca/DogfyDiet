import 'package:bloc_test/bloc_test.dart';
import 'package:dogfydiet/app/types/repository_error.dart';
import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/features/onboarding/domain/entities/activity_level_type.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/get_current_location.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/save_onboarding_data.dart';
import 'package:dogfydiet/features/onboarding/domain/usecases/submit_subscription.dart';
import 'package:dogfydiet/shared/bloc/onboarding_bloc.dart';
import 'package:dogfydiet/shared/bloc/onboarding_event.dart';
import 'package:dogfydiet/shared/bloc/onboarding_state.dart';
import 'package:dogfydiet/shared/domain/entities/dog_breed.dart';
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
  setUpAll(() {
    registerFallbackValue(const OnboardingData());
  });

  late OnboardingBloc onboardingBloc;
  late MockGetOnboardingData mockGetOnboardingData;
  late MockSaveOnboardingData mockSaveOnboardingData;
  late MockGetDogBreeds mockGetDogBreeds;
  late MockGetCurrentLocation mockGetCurrentLocation;
  late MockSubmitSubscription mockSubmitSubscription;

  setUp(() {
    mockGetOnboardingData = MockGetOnboardingData();
    mockSaveOnboardingData = MockSaveOnboardingData();
    mockGetDogBreeds = MockGetDogBreeds();
    mockGetCurrentLocation = MockGetCurrentLocation();
    mockSubmitSubscription = MockSubmitSubscription();

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

  group('OnboardingBloc', () {
    final testBreeds = [
      const DogBreed(id: 1, name: 'Labrador Retriever'),
      const DogBreed(id: 2, name: 'German Shepherd'),
    ];
    const testOnboardingData = OnboardingData(
      dogName: 'Buddy',
      ownerName: 'John Doe',
      location: 'Madrid',
      breedId: 1,
      activityLevel: ActivityLevelType.high,
    );

    group('Initial State', () {
      test('should have initial status, empty onboarding data and breeds', () {
        expect(onboardingBloc.state.status, OnboardingStatus.initial);
        expect(onboardingBloc.state.onboardingData, const OnboardingData());
        expect(onboardingBloc.state.dogBreeds, isEmpty);
      });
    });

    group('Data Loading', () {
      testWidgets(
        'emits loading and loaded when onboarding data loads successfully',
        (tester) async {
          when(
            () => mockGetOnboardingData(),
          ).thenAnswer((_) => const Result.success(testOnboardingData));
          onboardingBloc.add(const LoadOnboardingData());
          await tester.pump();
          expect(
            onboardingBloc.state.status,
            anyOf(OnboardingStatus.loading, OnboardingStatus.loaded),
          );
        },
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'emits [loading, loaded] when onboarding data loads successfully',
        setUp: () {
          when(
            () => mockGetOnboardingData(),
          ).thenAnswer((_) => const Result.success(testOnboardingData));
        },
        build: () => onboardingBloc,
        act: (bloc) => bloc.add(const LoadOnboardingData()),
        expect: () => [
          isA<OnboardingState>().having(
            (state) => state.status,
            'status',
            OnboardingStatus.loading,
          ),
          isA<OnboardingState>()
              .having(
                (state) => state.status,
                'status',
                OnboardingStatus.loaded,
              )
              .having(
                (state) => state.onboardingData,
                'onboardingData',
                testOnboardingData,
              ),
        ],
        verify: (_) {
          verify(() => mockGetOnboardingData()).called(1);
        },
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'emits [loading, error] when onboarding data fails to load',
        setUp: () {
          const error = RepositoryError.unknown(message: 'Load failed');
          when(
            () => mockGetOnboardingData(),
          ).thenAnswer((_) => const Result.failure(error: error));
        },
        build: () => onboardingBloc,
        act: (bloc) => bloc.add(const LoadOnboardingData()),
        expect: () => [
          isA<OnboardingState>().having(
            (state) => state.status,
            'status',
            OnboardingStatus.loading,
          ),
          isA<OnboardingState>()
              .having((state) => state.status, 'status', OnboardingStatus.error)
              .having(
                (state) => state.errorMessage,
                'errorMessage',
                'Load failed',
              ),
        ],
      );
    });

    group('Dog Breeds', () {
      blocTest<OnboardingBloc, OnboardingState>(
        'emits state with dog breeds when loaded',
        setUp: () {
          when(
            () => mockGetDogBreeds(),
          ).thenAnswer((_) async => Result.success(testBreeds));
        },
        build: () => onboardingBloc,
        act: (bloc) => bloc.add(const LoadDogBreeds()),
        expect: () => [
          isA<OnboardingState>().having(
            (state) => state.dogBreeds,
            'dogBreeds',
            testBreeds,
          ),
        ],
        verify: (_) {
          verify(() => mockGetDogBreeds()).called(1);
        },
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'emits error state when dog breeds fail to load',
        setUp: () {
          const error = RepositoryError.unknown(message: 'Fetch failed');
          when(
            () => mockGetDogBreeds(),
          ).thenAnswer((_) async => const Result.failure(error: error));
        },
        build: () => onboardingBloc,
        act: (bloc) => bloc.add(const LoadDogBreeds()),
        expect: () => [
          isA<OnboardingState>()
              .having((state) => state.status, 'status', OnboardingStatus.error)
              .having(
                (state) => state.errorMessage,
                'errorMessage',
                'Fetch failed',
              ),
        ],
      );
    });

    group('Onboarding Data Updates', () {
      blocTest<OnboardingBloc, OnboardingState>(
        'updates dog name',
        setUp: () {
          when(
            () => mockSaveOnboardingData(any()),
          ).thenAnswer((_) async => const Result.success(true));
        },
        build: () => onboardingBloc,
        act: (bloc) => bloc.add(const UpdateDogName('Max')),
        expect: () => [
          isA<OnboardingState>().having(
            (state) => state.onboardingData.dogName,
            'dogName',
            'Max',
          ),
        ],
        verify: (_) {
          verify(() => mockSaveOnboardingData(any())).called(1);
        },
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'updates breed selection',
        setUp: () {
          when(
            () => mockSaveOnboardingData(any()),
          ).thenAnswer((_) async => const Result.success(true));
        },
        build: () => onboardingBloc,
        act: (bloc) => bloc.add(const UpdateBreed(2)),
        expect: () => [
          isA<OnboardingState>().having(
            (state) => state.onboardingData.breedId,
            'breedId',
            2,
          ),
        ],
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'updates activity level',
        setUp: () {
          when(
            () => mockSaveOnboardingData(any()),
          ).thenAnswer((_) async => const Result.success(true));
        },
        build: () => onboardingBloc,
        act: (bloc) =>
            bloc.add(const UpdateActivityLevel(ActivityLevelType.low)),
        expect: () => [
          isA<OnboardingState>().having(
            (state) => state.onboardingData.activityLevel,
            'activityLevel',
            ActivityLevelType.low,
          ),
        ],
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'updates owner name',
        setUp: () {
          when(
            () => mockSaveOnboardingData(any()),
          ).thenAnswer((_) async => const Result.success(true));
        },
        build: () => onboardingBloc,
        act: (bloc) => bloc.add(const UpdateOwnerName('Jane Doe')),
        expect: () => [
          isA<OnboardingState>().having(
            (state) => state.onboardingData.ownerName,
            'ownerName',
            'Jane Doe',
          ),
        ],
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'updates location',
        setUp: () {
          when(
            () => mockSaveOnboardingData(any()),
          ).thenAnswer((_) async => const Result.success(true));
        },
        build: () => onboardingBloc,
        act: (bloc) => bloc.add(const UpdateLocation('Barcelona')),
        expect: () => [
          isA<OnboardingState>().having(
            (state) => state.onboardingData.location,
            'location',
            'Barcelona',
          ),
        ],
      );
    });

    group('Subscription', () {
      blocTest<OnboardingBloc, OnboardingState>(
        'emits [submitting, success] when subscription is successful',
        setUp: () {
          when(
            () => mockSubmitSubscription(any()),
          ).thenAnswer((_) async => const Result.success(true));
          when(
            () => mockSaveOnboardingData(any()),
          ).thenAnswer((_) async => const Result.success(true));
        },
        build: () => onboardingBloc,
        seed: () => const OnboardingState(onboardingData: testOnboardingData),
        act: (bloc) => bloc.add(const SubmitSubscriptionEvent()),
        expect: () => [
          isA<OnboardingState>().having(
            (state) => state.status,
            'status',
            OnboardingStatus.submitting,
          ),
          isA<OnboardingState>().having(
            (state) => state.status,
            'status',
            OnboardingStatus.success,
          ),
        ],
        verify: (_) {
          verify(() => mockSubmitSubscription(any())).called(1);
          verify(() => mockSaveOnboardingData(any())).called(1);
        },
      );

      blocTest<OnboardingBloc, OnboardingState>(
        'emits [submitting, error] when subscription fails',
        setUp: () {
          const error = RepositoryError.unknown(message: 'Submit failed');
          when(
            () => mockSubmitSubscription(any()),
          ).thenAnswer((_) async => const Result.failure(error: error));
        },
        build: () => onboardingBloc,
        seed: () => const OnboardingState(onboardingData: testOnboardingData),
        act: (bloc) => bloc.add(const SubmitSubscriptionEvent()),
        expect: () => [
          isA<OnboardingState>().having(
            (state) => state.status,
            'status',
            OnboardingStatus.submitting,
          ),
          isA<OnboardingState>()
              .having((state) => state.status, 'status', OnboardingStatus.error)
              .having(
                (state) => state.errorMessage,
                'errorMessage',
                'Submit failed',
              ),
        ],
      );
    });
  });
}
