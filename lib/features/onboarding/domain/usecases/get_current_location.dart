import 'package:dogfydiet/app/types/result.dart';
import 'package:dogfydiet/features/onboarding/domain/repositories/location_repository.dart';

class GetCurrentLocation {
  final LocationRepository repository;

  GetCurrentLocation(this.repository);

  Future<Result<String>> call() async {
    return await repository.getCurrentLocation();
  }
}
