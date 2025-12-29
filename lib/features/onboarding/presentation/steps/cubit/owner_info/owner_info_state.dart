import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner_info_state.freezed.dart';

@freezed
abstract class OwnerInfoState with _$OwnerInfoState {
  const factory OwnerInfoState({
    required String name,
    required String location,
  }) = _OwnerInfoState;
}
