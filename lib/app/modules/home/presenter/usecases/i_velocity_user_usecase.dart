import 'package:location/location.dart';

abstract class IVelocityUserUsecase {
 Stream<LocationData> getVelocity();
}