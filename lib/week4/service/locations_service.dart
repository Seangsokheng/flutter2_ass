import 'package:flutter_ass/week4/model/ride/locations.dart';
import 'package:flutter_ass/week4/repository/locations_repository.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  //static private instance
  static LocationsService? _instance;

  // access to the repository
  final LocationsRepository repository;

  static var availableLocations;

  //private constructor
  LocationsService._internal(this.repository);

  // Initialize
  static void initialize(LocationsRepository repository) {
    if (_instance == null) {
      _instance = LocationsService._internal(repository);
    } else {
      throw Exception("Location is already initialized");
    }
  }

  //singleton accessor
  static LocationsService get instance {
    if (_instance == null) {
      throw Exception("Location is not initialize. Call initialize() first.");
    }
    return _instance!;
  }

  //get location
  List<Location> getLocations() {
    return repository.getLocation();
  }

  //add location
  void addLocation(Location location) {
    return repository.addLocation(location);
  }
}
