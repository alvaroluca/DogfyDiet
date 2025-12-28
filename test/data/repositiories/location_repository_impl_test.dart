import 'package:dogfydiet/app/types/repository_error.dart';
import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/data/datasources/local_data_source/geolocation_local_data_source.dart';
import 'package:dogfydiet/data/datasources/local_data_source/permission_local_data_source.dart';
import 'package:dogfydiet/data/datasources/remote_data_source/location_remote_data_source.dart';
import 'package:dogfydiet/data/repositories/location_repository_impl.dart';
import 'package:dogfydiet/domain/entities/lat_lng.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

class _MockLocationRemoteDataSource extends Mock
    implements LocationRemoteDataSource {}

class _MockGeolocationLocalDataSource extends Mock
    implements GeolocationLocalDataSource {}

class _MockPermissionLocalDataSource extends Mock
    implements PermissionLocalDataSource {}

const _testLatLng = LatLng(40.4168, -3.7038);
const _testAddress = 'Main St, Madrid, Spain';

void main() {
  late _MockLocationRemoteDataSource remoteDataSource;
  late _MockGeolocationLocalDataSource geolocationLocalDataSource;
  late _MockPermissionLocalDataSource permissionLocalDataSource;
  late LocationRepositoryImpl repository;

  setUpAll(() {
    registerFallbackValue(Permission.locationWhenInUse);
    registerFallbackValue(const LatLng(0, 0));
  });

  setUp(() {
    remoteDataSource = _MockLocationRemoteDataSource();
    geolocationLocalDataSource = _MockGeolocationLocalDataSource();
    permissionLocalDataSource = _MockPermissionLocalDataSource();

    repository = LocationRepositoryImpl(
      remoteDataSource,
      geolocationLocalDataSource,
      permissionLocalDataSource,
    );

    when(
      () => geolocationLocalDataSource.isLocationServiceEnabled(),
    ).thenAnswer((_) async => true);
    when(
      () => permissionLocalDataSource.checkPermission(any()),
    ).thenAnswer((_) async => true);
    when(
      () => geolocationLocalDataSource.getLocation(),
    ).thenAnswer((_) async => _testLatLng);
    when(
      () => remoteDataSource.resolveAddress(any()),
    ).thenAnswer((_) async => _testAddress);
  });

  group('LocationRepositoryImpl', () {
    test('returns success with resolved address on happy path', () async {
      final result = await repository.getCurrentLocation();

      expect(result, isA<Result<String>>());
      expect(
        result.when(success: (data) => data, failure: (error) => null),
        _testAddress,
      );

      verify(() => geolocationLocalDataSource.getLocation()).called(1);
      verify(() => remoteDataSource.resolveAddress(_testLatLng)).called(1);
    });

    test('returns failure when location services are disabled', () async {
      when(
        () => geolocationLocalDataSource.isLocationServiceEnabled(),
      ).thenAnswer((_) async => false);

      final result = await repository.getCurrentLocation();

      expect(result, isA<Result<String>>());
      expect(
        result.when(success: (data) => null, failure: (error) => error),
        isA<RepositoryError>(),
      );

      verify(() => geolocationLocalDataSource.openSettings()).called(1);
      verifyNever(() => geolocationLocalDataSource.getLocation());
    });

    test('requests permission if not already granted', () async {
      when(
        () => permissionLocalDataSource.checkPermission(any()),
      ).thenAnswer((_) async => false);
      when(
        () => permissionLocalDataSource.requestPermission(any()),
      ).thenAnswer((_) async => PermissionStatus.granted);

      await repository.getCurrentLocation();

      verify(
        () => permissionLocalDataSource.requestPermission(any()),
      ).called(1);
    });

    test('returns failure when permission is denied', () async {
      when(
        () => permissionLocalDataSource.checkPermission(any()),
      ).thenAnswer((_) async => false);
      when(
        () => permissionLocalDataSource.requestPermission(any()),
      ).thenAnswer((_) async => PermissionStatus.denied);

      final result = await repository.getCurrentLocation();

      expect(result, isA<Result<String>>());
      expect(
        result.when(success: (data) => null, failure: (error) => error),
        isA<RepositoryError>(),
      );

      verifyNever(() => geolocationLocalDataSource.getLocation());
    });

    test('returns failure when permission is permanently denied', () async {
      when(
        () => permissionLocalDataSource.checkPermission(any()),
      ).thenAnswer((_) async => false);
      when(
        () => permissionLocalDataSource.requestPermission(any()),
      ).thenAnswer((_) async => PermissionStatus.permanentlyDenied);

      final result = await repository.getCurrentLocation();

      expect(result, isA<Result<String>>());
      expect(
        result.when(success: (data) => null, failure: (error) => error),
        isA<RepositoryError>(),
      );
    });

    test('catches exceptions and returns failure', () async {
      when(
        () => geolocationLocalDataSource.getLocation(),
      ).thenThrow(Exception('Network error'));

      final result = await repository.getCurrentLocation();

      expect(result, isA<Result<String>>());
      expect(
        result.when(success: (data) => null, failure: (error) => error),
        isA<RepositoryError>(),
      );
    });
  });
}
