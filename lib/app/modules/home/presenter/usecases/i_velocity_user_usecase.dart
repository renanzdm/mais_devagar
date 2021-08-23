import 'package:location/location.dart';

abstract class ILocationUserUsecase {
  Stream<LocationData> listenLocation();
  Future<LocationData> getLocation();
}
