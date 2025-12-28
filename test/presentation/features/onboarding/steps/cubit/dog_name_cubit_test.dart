import 'package:dogfydiet/presentation/features/onboarding/steps/cubit/dog_name/dog_name_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DogNameCubit', () {
    group('Initialization', () {
      test('emits correct state when initial value is provided', () {
        final cubit = DogNameCubit(initial: 'Buddy');
        expect(cubit.state, 'Buddy');
        cubit.close();
      });
    });

    group('State updates', () {
      test('controller text change updates state', () {
        final cubit = DogNameCubit(initial: 'Max');
        cubit.controller.text = 'Charlie';
        expect(cubit.state, 'Charlie');
        cubit.close();
      });
    });

    group('Callbacks', () {
      test('onChanged callback is called when text changes', () {
        String? value;
        final cubit = DogNameCubit(initial: '', onChanged: (v) => value = v);
        cubit.controller.text = 'Rocky';
        expect(value, 'Rocky');
        cubit.close();
      });
    });
  });
}
