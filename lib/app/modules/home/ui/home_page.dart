import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mais_devagar/app/modules/core/utils/sizes.dart';
import 'package:mais_devagar/app/modules/home/controllers/home_cubit.dart';

import 'widgets/bottom_buttom/bottom_button_options_widget.dart';
import 'widgets/bottom_buttom/button_options_type_widget.dart';
import 'widgets/bottom_buttom/controller/button_cuibit.dart';
import 'widgets/informations_display/controllers/elapsed_time_cubit.dart';
import 'widgets/informations_display/information_display_widget.dart';
import 'widgets/velocimeter_display/velocimeter_display_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeCubit _homeCubit = Modular.get<HomeCubit>();
  final ElapsedTimeCubit _elapsedTimeCubit = Modular.get<ElapsedTimeCubit>();
  final ButtonCubit _buttonCubit = Modular.get<ButtonCubit>();
  int indexSelected = 0;
  final List<IconData> _icons = [
    FontAwesomeIcons.tachometerAlt,
    FontAwesomeIcons.digitalTachograph,
    FontAwesomeIcons.mapMarkedAlt,
  ];

  @override
  void dispose() {
    super.dispose();
    _homeCubit.close();
    _buttonCubit.close();
    _elapsedTimeCubit.close();
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
              flex: 3,
              child: Container(
                child: VelocimeterDisplayWidget(),
              ),
            ),
            Text(
              'Km/h',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: Sizes.maxWidth(context),
              child: InformationDisplayWidget(),
            ),
            Expanded(
              child: Center(
                child: ElevatedButton(
                    onPressed: () async {
                      if (_elapsedTimeCubit.isRunnig()) {
                        _elapsedTimeCubit.stopWatch();
                      } else {
                        await _homeCubit.getInitDistance();
                        await _homeCubit.fetchLocation();
                        _elapsedTimeCubit.initTimeWatch();
                      }
                    },
                    child: Text('Iniciar')),
              ),
            ),
            BottomButtonOptions(
              buttons: List.generate(
                3,
                (index) => ButtonOptionsType(
                  onTap: () {
                    _buttonCubit.changeButton(indexClicked: index);
                  },
                  icon: _icons[index],
                  indexButton: index,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
