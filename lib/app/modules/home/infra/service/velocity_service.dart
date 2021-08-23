import 'package:location/location.dart';
import 'package:mais_devagar/app/modules/home/domain/service/i_velocity_service.dart';
import 'package:mais_devagar/app/modules/home/infra/drivers/i_velocity_drivers.dart';

class GeolocatorService implements IGeolocatorService {
  IGeolocatorDrivers locationDrivers;
  GeolocatorService({
    required this.locationDrivers,
  });

  @override
  Stream<LocationData> listenLocationData() {
    return locationDrivers.listenLocationUserDriver();
  }

  @override
  Future<LocationData> getLocationData() async {
    return locationDrivers.getLocationUserDriver();
  }
}
