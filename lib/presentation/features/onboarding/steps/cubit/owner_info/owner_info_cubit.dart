import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'owner_info_state.dart';

class OwnerInfoCubit extends Cubit<OwnerInfoState> {
  final TextEditingController nameController;
  final TextEditingController locationController;
  final void Function(String)? onNameChanged;
  final void Function(String)? onLocationChanged;

  OwnerInfoCubit({
    String? initialName,
    String? initialLocation,
    this.onNameChanged,
    this.onLocationChanged,
  }) : nameController = TextEditingController(text: initialName ?? ''),
       locationController = TextEditingController(text: initialLocation ?? ''),
       super(
         OwnerInfoState(
           name: initialName ?? '',
           location: initialLocation ?? '',
         ),
       ) {
    nameController.addListener(_onNameChanged);
    locationController.addListener(_onLocationChanged);
  }

  void _onNameChanged() {
    if (state.name != nameController.text) {
      emit(OwnerInfoState(name: nameController.text, location: state.location));
      if (onNameChanged != null) onNameChanged!(nameController.text);
    }
  }

  void _onLocationChanged() {
    if (state.location != locationController.text) {
      emit(OwnerInfoState(name: state.name, location: locationController.text));
      if (onLocationChanged != null) {
        onLocationChanged!(locationController.text);
      }
    }
  }

  void setLocation(String value) {
    if (locationController.text != value) {
      locationController.text = value;
    }
  }

  @override
  Future<void> close() {
    nameController.removeListener(_onNameChanged);
    locationController.removeListener(_onLocationChanged);
    nameController.dispose();
    locationController.dispose();
    return super.close();
  }
}
