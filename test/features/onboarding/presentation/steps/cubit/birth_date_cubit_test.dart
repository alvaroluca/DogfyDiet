import 'package:dogfydiet/features/onboarding/presentation/steps/cubit/birth_date/birth_date_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BirthDateCubit', () {
    group('Initialization', () {
      test('emits correct state when initial birth date is provided', () {
        final date = DateTime(2020, 5, 15);
        final cubit = BirthDateCubit(initialBirthDate: date);
        expect(cubit.state.selectedYear, 2020);
        expect(cubit.state.selectedMonth, 5);
      });
    });

    group('State updates', () {
      test('updateYear sets selectedYear', () {
        final cubit = BirthDateCubit();
        cubit.updateYear(2018);
        expect(cubit.state.selectedYear, 2018);
      });

      test('updateMonth sets selectedMonth', () {
        final cubit = BirthDateCubit();
        cubit.updateMonth(7);
        expect(cubit.state.selectedMonth, 7);
      });

      test('updateDate sets both selectedYear and selectedMonth', () {
        final cubit = BirthDateCubit();
        cubit.updateDate(2019, 12);
        expect(cubit.state.selectedYear, 2019);
        expect(cubit.state.selectedMonth, 12);
      });
    });
  });
}
