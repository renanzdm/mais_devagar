import 'package:location/location.dart';
import 'package:mais_devagar/app/modules/home/domain/service/i_velocity_service.dart';
import 'package:mais_devagar/app/modules/home/infra/drivers/i_velocity_drivers.dart';

class GeolocatorService implements IGeolocatorService {
  IGeolocatorDrivers velocityDrivers;
  GeolocatorService({
    required this.velocityDrivers,
  });

  @override
  Stream<LocationData> getVelocity() {
    return velocityDrivers.getVelocityUserDriver();
  }


}
