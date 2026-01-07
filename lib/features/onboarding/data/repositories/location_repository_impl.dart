import 'package:dogfydiet/core/types/repository_error.dart';
import 'package:dogfydiet/core/types/result.dart';
import 'package:dogfydiet/features/onboarding/data/datasources/local_data_source/geolocation_local_data_source.dart';
import 'package:dogfydiet/features/onboarding/data/datasources/local_data_source/permission_local_data_source.dart';
import 'package:dogfydiet/features/onboarding/data/datasources/remote_data_source/location_remote_data_source.dart';
import 'package:dogfydiet/features/onboarding/domain/repositories/location_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationRepositoryImpl implements LocationRepository {
  LocationRepositoryImpl(
    this._locationRemoteDataSource,
    this._geolocationLocalDataSource,
    this._permissionLocalDataSource,
  );

  final LocationRemoteDataSource _locationRemoteDataSource;
  final GeolocationLocalDataSource _geolocationLocalDataSource;
  final PermissionLocalDataSource _permissionLocalDataSource;

  @override
  Future<Result<String>> getCurrentLocation() async {
    try {
      final serviceEnabled = await _geolocationLocalDataSource
          .isLocationServiceEnabled();
      if (!serviceEnabled) {
        await _geolocationLocalDataSource.openSettings();
        return const Result.failure(
          error: RepositoryError.unknown(
            message: 'Location services are disabled.',
          ),
        );
      }

      final hasPermission = await _permissionLocalDataSource.checkPermission(
        Permission.locationWhenInUse,
      );

      if (!hasPermission) {
        final status = await _permissionLocalDataSource.requestPermission(
          Permission.locationWhenInUse,
        );

        if (status == PermissionStatus.denied) {
          return const Result.failure(
            error: RepositoryError.unknown(
              message: 'Location permissions are denied',
            ),
          );
        }

        if (status == PermissionStatus.permanentlyDenied ||
            status == PermissionStatus.restricted) {
          return const Result.failure(
            error: RepositoryError.unknown(
              message:
                  'Location permissions are permanently denied, we cannot request permissions.',
            ),
          );
        }
      }

      final coordinates = await _geolocationLocalDataSource.getLocation();

      final address = await _locationRemoteDataSource.resolveAddress(
        coordinates,
      );

      return Result.success(address);
    } catch (e) {
      return Result.failure(
        error: RepositoryError.unknown(message: e.toString()),
      );
    }
  }
}
