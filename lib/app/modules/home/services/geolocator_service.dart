import 'package:location/location.dart';

class GeolocatorService {
  final Location location;

  GeolocatorService(this.location);

  Stream<LocationData> listenLocationUserDriver() {
    return location.onLocationChanged;
  }

  Future<LocationData> getLocationUserDriver() async {
    return await location.getLocation();
  }
}
