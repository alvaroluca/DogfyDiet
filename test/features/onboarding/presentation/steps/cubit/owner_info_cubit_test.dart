import 'package:dogfydiet/features/onboarding/presentation/steps/cubit/owner_info/owner_info_cubit.dart';
import 'package:dogfydiet/features/onboarding/presentation/steps/cubit/owner_info/owner_info_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OwnerInfoCubit', () {
    group('Initialization', () {
      test('emits correct state when initial values are provided', () {
        final cubit = OwnerInfoCubit(
          initialName: 'John',
          initialLocation: 'NY',
        );
        expect(cubit.state, const OwnerInfoState(name: 'John', location: 'NY'));
        cubit.close();
      });
    });

    group('State updates', () {
      test('nameController text change updates state', () {
        final cubit = OwnerInfoCubit(initialName: 'A', initialLocation: 'B');
        cubit.nameController.text = 'Alice';
        expect(cubit.state.name, 'Alice');
        cubit.close();
      });

      test('locationController text change updates state', () {
        final cubit = OwnerInfoCubit(initialName: 'A', initialLocation: 'B');
        cubit.locationController.text = 'Boston';
        expect(cubit.state.location, 'Boston');
        cubit.close();
      });

      test('setLocation updates locationController', () {
        final cubit = OwnerInfoCubit(initialName: '', initialLocation: '');
        cubit.setLocation('Paris');
        expect(cubit.locationController.text, 'Paris');
        cubit.close();
      });
    });

    group('Callbacks', () {
      test(
        'onNameChanged and onLocationChanged callbacks are called when text changes',
        () {
          String? name;
          String? location;
          final cubit = OwnerInfoCubit(
            initialName: '',
            initialLocation: '',
            onNameChanged: (n) => name = n,
            onLocationChanged: (l) => location = l,
          );
          cubit.nameController.text = 'Bob';
          cubit.locationController.text = 'LA';
          expect(name, 'Bob');
          expect(location, 'LA');
          cubit.close();
        },
      );
    });
  });
}
