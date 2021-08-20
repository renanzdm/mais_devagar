import 'package:flutter_modular/flutter_modular.dart';
import 'package:mais_devagar/app/modules/introduction/introduction_page.dart';

class IntroductionModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/introduction', child: (context, args) => IntroductionPage()),
  ];
}
