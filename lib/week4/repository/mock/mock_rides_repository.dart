import 'package:flutter_ass/week4/dummy_data/dummy_data.dart';
import 'package:flutter_ass/week4/model/ride/ride.dart';
import 'package:flutter_ass/week4/model/ride_pref/ride_pref.dart';
import 'package:flutter_ass/week4/repository/rides_repository.dart';
import 'package:flutter_ass/week4/service/rides_service.dart';

class MockRidesRepository extends RidesRepository {
  // Mock ride data
  List<Ride> rides = fakeLocationRides;

  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return rides.where((ride) {
      bool matchesLocation =
          ride.departureLocation == preference.departure &&
          ride.arrivalLocation == preference.arrival &&
          ride.availableSeats >= preference.requestedSeats;

      // Apply pet filter if needed
      bool matchesPetFilter =
          filter == null ||
          (filter.acceptPets
              ? ride.driver.verifiedProfile
              : !ride.driver.verifiedProfile);

      return matchesLocation && matchesPetFilter;
    }).toList();
  }
}
