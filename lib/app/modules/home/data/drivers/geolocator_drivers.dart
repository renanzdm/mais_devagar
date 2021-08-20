
import 'package:location/location.dart';
import 'package:mais_devagar/app/modules/home/infra/drivers/i_velocity_drivers.dart';

class GeolocatorDriver extends IGeolocatorDrivers {
 final Location location;

  GeolocatorDriver(this.location);

  @override
  Stream<LocationData> getVelocityUserDriver(){
   return location.onLocationChanged;
  }
}
