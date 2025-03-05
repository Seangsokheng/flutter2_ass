import 'package:flutter_ass/week4/model/ride/ride.dart';
import 'package:flutter_ass/week4/model/ride_pref/ride_pref.dart';
import 'package:flutter_ass/week4/repository/rides_repository.dart';

class RidesService {
  static RidesService? _instance;
  final RidesRepository _repository;

  // Private constructor
  RidesService._(this._repository);

  // Singleton instance getter
  static RidesService get instance {
    if (_instance == null) {
      throw StateError('RidesService must be initialized before use');
    }
    return _instance!;
  }

  // Initialize method
  static void initialize(RidesRepository repository) {
    _instance = RidesService._(repository);
  }

  // Get rides method
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return _repository.getRides(preference, filter);
  }
}
class RidesFilter {
  final bool acceptPets;

  RidesFilter({required this.acceptPets});
}