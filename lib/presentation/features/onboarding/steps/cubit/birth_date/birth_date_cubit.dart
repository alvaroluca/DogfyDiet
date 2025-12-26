import 'package:flutter_bloc/flutter_bloc.dart';

import 'birth_date_state.dart';

class BirthDateCubit extends Cubit<BirthDateState> {
  BirthDateCubit({DateTime? initialBirthDate})
    : super(BirthDateState.initial(initialBirthDate));

  void updateYear(int? year) {
    emit(state.copyWith(selectedYear: year));
  }

  void updateMonth(int? month) {
    emit(state.copyWith(selectedMonth: month));
  }

  void updateDate(int year, int month) {
    emit(state.copyWith(selectedYear: year, selectedMonth: month));
  }
}
