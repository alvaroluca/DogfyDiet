import 'package:dogfydiet/core/types/result.dart';

abstract class LocationRepository {
  Future<Result<String>> getCurrentLocation();
}
