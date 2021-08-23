import 'package:location/location.dart';

abstract class IGeolocatorDrivers {
  Stream<LocationData> listenLocationUserDriver();
  Future<LocationData> getLocationUserDriver();
}
