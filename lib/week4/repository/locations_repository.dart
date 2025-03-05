import '../model/ride/locations.dart';

abstract class LocationsRepository {

  List<Location> getLocation();

  void addLocation(Location location);
}
