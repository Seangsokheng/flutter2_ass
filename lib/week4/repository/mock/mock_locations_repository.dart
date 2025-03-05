import 'package:flutter_ass/week4/model/ride/locations.dart';
import 'package:flutter_ass/week4/repository/locations_repository.dart';
import '../../dummy_data/dummy_data.dart';

class MockLocationsRepository extends LocationsRepository {
  final List<Location> locations = fakeLocations;

  @override
  List<Location> getLocation() {
    return locations;
  }

  @override
  void addLocation(Location location) {
    locations.add(location);
  }
}
