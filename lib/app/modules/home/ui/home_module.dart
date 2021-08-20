import 'package:flutter_modular/flutter_modular.dart';
import 'package:location/location.dart';
import 'package:mais_devagar/app/modules/home/data/drivers/geolocator_drivers.dart';
import 'package:mais_devagar/app/modules/home/domain/service/i_velocity_service.dart';
import 'package:mais_devagar/app/modules/home/domain/usecases/velocity_user_usecase.dart';
import 'package:mais_devagar/app/modules/home/infra/service/velocity_service.dart';
import 'package:mais_devagar/app/modules/home/presenter/controllers/home_bloc.dart';
import 'package:mais_devagar/app/modules/home/presenter/controllers/home_state.dart';
import 'package:mais_devagar/app/modules/home/presenter/usecases/i_velocity_user_usecase.dart';
import 'package:mais_devagar/app/modules/home/ui/widgets/controller/button_controller/button_bloc.dart';
import 'package:mais_devagar/app/modules/home/ui/widgets/controller/button_controller/button_state.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<Location>((i) => Location.instance),
    Bind.lazySingleton<GeolocatorDriver>((i) => GeolocatorDriver(i.get())),
    Bind.lazySingleton<IGeolocatorService>(
        (i) => GeolocatorService(velocityDrivers: i.get())),
    Bind.lazySingleton<IVelocityUserUsecase>(
        (i) => VelocityUserUsecase(iVelocityService: i.get())),
    Bind.lazySingleton<HomeBloc>((i) => HomeBloc(HomeStateInitial(), i.get())),
    Bind.lazySingleton((i) => ButtonBloc(ButtonStateInital()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (context, args) => HomePage()),
  ];
}