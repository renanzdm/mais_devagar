import 'package:location/location.dart';

abstract class IGeolocatorService {
  Stream<LocationData> getVelocity();

}