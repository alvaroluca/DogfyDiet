import 'package:dogfydiet/features/onboarding/domain/entities/lat_lng.dart';
import 'package:geolocator/geolocator.dart';

abstract class GeolocationLocalDataSource {
  Future<bool> isLocationServiceEnabled();

  Future<LatLng> getLocation();

  Future<void> openSettings();
}

class GeolocationLocalDataSourceImpl implements GeolocationLocalDataSource {
  @override
  Future<bool> isLocationServiceEnabled() =>
      Geolocator.isLocationServiceEnabled();

  @override
  Future<LatLng> getLocation() async {
    final location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    return LatLng(location.latitude, location.longitude);
  }

  @override
  Future<void> openSettings() => Geolocator.openLocationSettings();
}
