import 'package:flutter_modular/flutter_modular.dart';
import 'package:mais_devagar/app/modules/splash/controller/splash_bloc.dart';
import 'package:mais_devagar/app/modules/splash/controller/splash_state.dart';
import 'package:mais_devagar/app/modules/splash/ui/splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashBloc(SplashStateInitial()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/splash', child: (context, args) => SplashPage()),
  ];
}
