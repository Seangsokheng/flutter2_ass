import 'package:flutter_ass/week4/dummy_data/dummy_data.dart';
import 'package:flutter_ass/week4/model/ride_pref/ride_pref.dart';
import 'package:flutter_ass/week4/repository/mock/mock_rides_repository.dart';
import 'package:flutter_ass/week4/service/rides_service.dart';

void main() {
  // Initialize service with the mock repository
  RidesService.initialize(MockRidesRepository());

  // Run dynamic tests
  testRidePreference(
    departureIndex: 2, // Battambang
    arrivalIndex: 1,   // Siem Reap
    requestedSeats: 1,
    acceptPets: null,  // No filter
    testName: "Test 1: Multiple Rides",
  );

  testRidePreference(
    departureIndex: 2, // Battambang
    arrivalIndex: 1,   // Siem Reap
    requestedSeats: 1,
    acceptPets: true, // Only rides that allow pets
    testName: "Test 2: Rides with Pet Filter",
  );
}

///
/// Dynamic function to test ride preferences.
///
void testRidePreference({
  required int departureIndex,
  required int arrivalIndex,
  required int requestedSeats,
  required String testName,
  bool? acceptPets,
}) {
  print("\n--- $testName ---");

  RidePreference preference = RidePreference(
    departure: fakeLocations[departureIndex],
    departureDate: DateTime.now(),
    arrival: fakeLocations[arrivalIndex],
    requestedSeats: requestedSeats,
  );

  RidesFilter? filter;
  if (acceptPets != null) {
    filter = RidesFilter(acceptPets: acceptPets);
  }

  final rides = RidesService.instance.getRides(preference, filter);

  print("For your preference (${preference.departure.name} -> ${preference.arrival.name}, today, $requestedSeats passenger${requestedSeats > 1 ? 's' : ''}) we found ${rides.length} ride(s):");

  // Count full rides
  int fullRideCount = rides.where((ride) => ride.availableSeats == 0).length;

  if (fullRideCount > 0) {
    print("Warning: $fullRideCount ride(s) are full!");
  }

  // Sort rides by departure time
  rides.sort((a, b) => a.departureDate.compareTo(b.departureDate));

  for (var ride in rides) {
    String time = ride.departureDate.toString().substring(11, 16);
    int duration = ride.arrivalDateTime.difference(ride.departureDate).inHours;
    print("- at $time with ${ride.driver.firstName} ($duration hours, ${ride.availableSeats} seats left)");
  }
}
