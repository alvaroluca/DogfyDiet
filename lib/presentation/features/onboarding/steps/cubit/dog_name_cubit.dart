import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogNameCubit extends Cubit<String> {
  final TextEditingController controller;
  final void Function(String)? onChanged;

  DogNameCubit({String initial = '', this.onChanged})
    : controller = TextEditingController(text: initial),
      super(initial) {
    controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final v = controller.text;
    if (state != v) emit(v);
    if (onChanged != null) onChanged!(v);
  }

  @override
  Future<void> close() {
    controller.removeListener(_onTextChanged);
    controller.dispose();
    return super.close();
  }
}
