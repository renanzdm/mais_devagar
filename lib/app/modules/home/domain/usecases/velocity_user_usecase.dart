import 'package:location/location.dart';
import 'package:mais_devagar/app/modules/home/domain/service/i_velocity_service.dart';
import 'package:mais_devagar/app/modules/home/presenter/usecases/i_velocity_user_usecase.dart';

class VelocityUserUsecase implements IVelocityUserUsecase {
  IGeolocatorService iVelocityService;

  VelocityUserUsecase({
    required this.iVelocityService,
  });

  @override
  Stream<LocationData> getVelocity() {
    return iVelocityService.getVelocity();
  }
}
