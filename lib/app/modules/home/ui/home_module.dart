import 'package:flutter_modular/flutter_modular.dart';
import 'package:location/location.dart';
import 'package:mais_devagar/app/modules/home/controllers/home_bloc.dart';
import 'package:mais_devagar/app/modules/home/controllers/home_state.dart';
import 'package:mais_devagar/app/modules/home/services/geolocator_service.dart';
import 'package:mais_devagar/app/modules/home/ui/widgets/informations_display/controllers/elapsed_time_bloc.dart';
import 'package:mais_devagar/app/modules/home/ui/widgets/informations_display/controllers/elapsed_time_state.dart';

import 'home_page.dart';
import 'widgets/bottom_buttom/controller/button_bloc.dart';
import 'widgets/bottom_buttom/controller/button_state.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<Location>((i) => Location.instance),
    Bind.lazySingleton<GeolocatorService>((i) => GeolocatorService(i.get())),
    Bind.lazySingleton<HomeBloc>((i) => HomeBloc(HomeStateInitial(), i.get())),
    Bind.lazySingleton((i) => ButtonBloc(ButtonStateInital())),
    Bind.lazySingleton((i) => ElapsedTimeBloc(ElapsedTimeStateInitial())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (context, args) => HomePage()),
  ];
}
