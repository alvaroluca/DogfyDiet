import 'package:freezed_annotation/freezed_annotation.dart';

part 'lat_lng.freezed.dart';

@freezed
abstract class LatLng with _$LatLng {
  const factory LatLng(double latitude, double longitude) = _LatLng;
}
