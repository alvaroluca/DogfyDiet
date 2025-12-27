import 'package:dogfydiet/domain/entities/lat_lng.dart';
import 'package:geocoding/geocoding.dart';

abstract class LocationRemoteDataSource {
  Future<String> resolveAddress(LatLng coordinates);
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  @override
  Future<String> resolveAddress(LatLng coordinates) async {
    final resolvedAddress = await _resolveAddress(coordinates);
    return resolvedAddress ?? _formatCoordinates(coordinates);
  }

  Future<String?> _resolveAddress(LatLng coordinates) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        coordinates.latitude,
        coordinates.longitude,
      );

      if (placemarks.isEmpty) {
        return null;
      }

      final place = placemarks.first;
      final parts = [
        place.street ?? '',
        place.locality ?? '',
        place.country ?? '',
      ].where((part) => part.isNotEmpty).toList();

      if (parts.isEmpty) {
        return null;
      }

      return parts.join(', ');
    } catch (_) {
      return null;
    }
  }

  String _formatCoordinates(LatLng coordinates) =>
      '${coordinates.latitude.toStringAsFixed(4)}, ${coordinates.longitude.toStringAsFixed(4)}';
}
