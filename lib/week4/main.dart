
import 'package:flutter_ass/week4/dummy_data/dummy_data.dart';

import 'package:flutter_ass/week4/model/ride_pref/ride_pref.dart';

import 'package:flutter_ass/week4/repository/mock/mock_rides_repository.dart';

import 'package:flutter_ass/week4/service/rides_service.dart';


void main() {

  // 1 - Initialize the services
  // RidePrefService.initialize(MockRidePreferencesRepository());
  // // Initialize services
  // LocationsService.initialize(MockLocationsRepository());
  // List<Location> locations = LocationsService.instance.getLocations();

  //   for (var location in locations) {
  //     print("City: ${location.name}, Country: ${location.country}");
// }
RidesService.initialize(MockRidesRepository());

  // Create a test ride preference
  RidePreference testPreference = RidePreference(
    departure: fakeLocations[2], // Battambang
    departureDate: DateTime.now(),
    arrival: fakeLocations[1], // Siem Reap
    requestedSeats: 2,
  );

  // Print rides for the preference with detailed information
  print("\n---- RIDES FROM BATTAMBANG TO SIEM REAP ----");
  print("Departure\tArrival\tDate Dep\tDuration\tUser\t\tAccept Pets\tSeats");
  print("-" * 80);

  final rides = RidesService.instance.getRides(testPreference, null);
  for (var ride in rides) {
    print(
      "${ride.departureLocation.name}\t"
      "${ride.arrivalLocation.name}\t"
      "${ride.departureDate.toString().substring(11, 16)}\t"
      "${ride.arrivalDateTime.difference(ride.departureDate).inHours} hours\t\t"
      "${ride.driver.firstName}\t\t"
      "${ride.driver.verifiedProfile ? 'Yes' : 'No'}\t\t"
      "${ride.availableSeats}"
    );
  }
  // 2- Run the UI
  // runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: appTheme,
//       home: Scaffold(body: RidePrefScreen()),
//     );
//   }
// }
