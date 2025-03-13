abstract class RidePreferencesListener {
  void onPreferenceSelected(RidePreference selectedPreference);
}

class RidePreferencesService {
  RidePreference? _selectedPreference;
  final List<RidePreferencesListener> _listeners = [];

  void addListener(RidePreferencesListener listener) {
    _listeners.add(listener);
  }

  void setPreference(RidePreference preference) {
    _selectedPreference = preference;
    _notifyListeners();
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener.onPreferenceSelected(_selectedPreference!);
    }
  }
}

class ConsoleLogger extends RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePreference selectedPreference) {
    print("🚗 ConsoleLogger: New preference selected -> $selectedPreference");
  }
}

class Test extends RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePreference selectedPreference) {
    print("🚗 test $selectedPreference");
  }
}

enum RidePreference { SOkheng, Visal, Vath }

void main() {
  // Create service
  RidePreferencesService rideService = RidePreferencesService();

  ConsoleLogger logger = ConsoleLogger();
  rideService.addListener(logger);

  Test test = Test();
  rideService.addListener(test);

  rideService.setPreference(RidePreference.SOkheng);
  rideService.setPreference(RidePreference.Vath);
  rideService.setPreference(RidePreference.Visal);
}
