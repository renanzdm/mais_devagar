import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mais_devagar/app/modules/core/utils/sizes.dart';
import 'package:mais_devagar/app/modules/home/presenter/controllers/home_bloc.dart';
import 'package:mais_devagar/app/modules/home/presenter/controllers/home_event.dart';
import 'package:mais_devagar/app/modules/home/ui/widgets/bottom_buttom/bottom_button_options_widget.dart';
import 'package:mais_devagar/app/modules/home/ui/widgets/bottom_buttom/button_options_type_widget.dart';

import 'widgets/bottom_buttom/controller/button_bloc.dart';
import 'widgets/bottom_buttom/controller/button_event.dart';
import 'widgets/informations_display/information_display_widget.dart';
import 'widgets/velocimeter_display/velocimeter_display_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _homeBloc = Modular.get<HomeBloc>();
  final ButtonBloc _buttonBloc = Modular.get<ButtonBloc>();
  int indexSelected = 0;
  final List<IconData> _icons = [
    FontAwesomeIcons.tachometerAlt,
    FontAwesomeIcons.digitalTachograph,
    FontAwesomeIcons.mapMarkedAlt,
  ];
  @override
  void initState() {
    _buttonBloc.add(ButtonEventChangeButton(index: 0));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _homeBloc.close();
    _buttonBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Speed Meeter'),
      ),
      body: Container(
        height: Sizes.maxHeight(context),
        child: Column(
          children: [
            Expanded(
                flex: 7,
                child: Center(
                    child: Container(child: VelocimeterDisplayWidget()))),
            Container(
              width: Sizes.maxWidth(context),
              color: Colors.red,
              child: InformationDisplayWidget(),
            ),
            Expanded(
                flex: 4,
                child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        _homeBloc.add(HomeEventGetInitLatAndLong());

                        _homeBloc.add(HomeEventGetVelocity());
                      },
                      child: Text('Iniciar')),
                )),
            BottomButtonOptions(
                buttons: List.generate(
                    3,
                    (index) => ButtonOptionsType(
                          onTap: () {
                            _buttonBloc
                                .add(ButtonEventChangeButton(index: index));
                          },
                          icon: _icons[index],
                          indexButton: index,
                        )))
          ],
        ),
      ),
    );
  }
}
