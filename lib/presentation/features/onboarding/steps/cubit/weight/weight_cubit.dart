import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightCubit extends Cubit<double> {
  final TextEditingController controller;
  final void Function(double)? onChanged;

  WeightCubit({required double weight, this.onChanged})
    : controller = TextEditingController(text: weight.toString()),
      super(weight) {
    controller.addListener(_onTextChanged);
    _onTextChanged();
  }

  void _onTextChanged() {
    final v = double.tryParse(controller.text.replaceAll(',', '.')) ?? 0;
    if (state != v) emit(v);
    if (onChanged != null) onChanged!(v);
  }

  void setWeight(double weight) {
    if (controller.text != weight.toString()) {
      controller.text = weight.toString();
      emit(weight);
      if (onChanged != null) onChanged!(weight);
    }
  }

  @override
  Future<void> close() {
    controller.removeListener(_onTextChanged);
    controller.dispose();
    return super.close();
  }
}
