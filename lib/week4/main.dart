import 'package:flutter/material.dart';
import 'package:flutter_ass/week4/model/ride/locations.dart';
import 'package:flutter_ass/week4/repository/mock/mock_locations_repository.dart';
import 'package:flutter_ass/week4/repository/mock/mock_ride_preferences_repository.dart';
import 'package:flutter_ass/week4/service/locations_service.dart';
import 'screens/ride_pref/ride_pref_screen.dart';
import 'service/ride_prefs_service.dart';
import 'theme/theme.dart';

void main() {

  // 1 - Initialize the services
  RidePrefService.initialize(MockRidePreferencesRepository());
  // Initialize services
  LocationsService.initialize(MockLocationsRepository());
  List<Location> locations = LocationsService.instance.getLocations();

    for (var location in locations) {
      print("City: ${location.name}, Country: ${location.country}");
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
