import 'package:freezed_annotation/freezed_annotation.dart';

part 'birth_date_state.freezed.dart';

@freezed
abstract class BirthDateState with _$BirthDateState {
  const factory BirthDateState({
    int? selectedYear,
    int? selectedMonth,
    required List<int> years,
    required List<int> months,
  }) = _BirthDateState;

  factory BirthDateState.initial(DateTime? birthDate) {
    final now = DateTime.now();
    final years = List<int>.generate(20, (index) => now.year - index);
    const months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    return BirthDateState(
      selectedYear: birthDate?.year,
      selectedMonth: birthDate?.month,
      years: years,
      months: months,
    );
  }
}
