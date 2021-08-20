import 'package:flutter_modular/flutter_modular.dart';
import 'package:mais_devagar/app/modules/introduction/introduction_module.dart';

import 'package:mais_devagar/objectbox.g.dart';

import 'modules/home/ui/home_module.dart';
import 'modules/splash/ui/splash_guard.dart';
import 'modules/splash/ui/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    AsyncBind<Store>((i) => openStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute,
        module: SplashModule(), guards: [SplashGuard()]),
    ModuleRoute(Modular.initialRoute, module: IntroductionModule()),
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
