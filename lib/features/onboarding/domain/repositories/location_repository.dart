import 'package:dogfydiet/app/types/result.dart';

abstract class LocationRepository {
  Future<Result<String>> getCurrentLocation();
}
