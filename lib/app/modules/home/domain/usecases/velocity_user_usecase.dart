import 'package:location/location.dart';
import 'package:mais_devagar/app/modules/home/domain/service/i_velocity_service.dart';
import 'package:mais_devagar/app/modules/home/presenter/usecases/i_velocity_user_usecase.dart';

class VelocityUserUsecase implements ILocationUserUsecase {
  IGeolocatorService iLocationService;

  VelocityUserUsecase({
    required this.iLocationService,
  });

  @override
  Stream<LocationData> listenLocation() {
    return iLocationService.listenLocationData();
  }

  @override
  Future<LocationData> getLocation() async {
    return await iLocationService.getLocationData();
  }
}
