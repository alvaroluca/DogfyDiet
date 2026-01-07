import 'package:dogfydiet/features/onboarding/presentation/steps/cubit/weight/weight_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WeightCubit', () {
    group('Initialization', () {
      test('emits correct state when initial weight is provided', () {
        final cubit = WeightCubit(weight: 10.0);
        expect(cubit.state, 10.0);
        cubit.close();
      });
    });

    group('State updates', () {
      test('setWeight updates state and controller', () {
        final cubit = WeightCubit(weight: 5.0);
        cubit.setWeight(12.5);
        expect(cubit.state, 12.5);
        expect(cubit.controller.text, '12.5');
        cubit.close();
      });

      test('controller text change updates state', () {
        final cubit = WeightCubit(weight: 3.0);
        cubit.controller.text = '7.2';
        expect(cubit.state, 7.2);
        cubit.close();
      });
    });

    group('Callbacks', () {
      test('onChanged callback is called when weight changes', () {
        double? value;
        final cubit = WeightCubit(weight: 2.0, onChanged: (v) => value = v);
        cubit.setWeight(8.0);
        expect(value, 8.0);
        cubit.close();
      });
    });
  });
}
