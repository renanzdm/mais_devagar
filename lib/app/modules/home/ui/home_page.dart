import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mais_devagar/app/modules/core/utils/sizes.dart';
import 'package:mais_devagar/app/modules/home/presenter/controllers/home_bloc.dart';
import 'package:mais_devagar/app/modules/home/ui/widgets/bottom_button_options.dart';
import 'package:mais_devagar/app/modules/home/ui/widgets/button_options_type.dart';
import 'package:mais_devagar/app/modules/home/ui/widgets/controller/button_controller/button_event.dart';
import 'package:mais_devagar/app/modules/home/ui/widgets/controller/button_controller/button_state.dart';

import 'widgets/controller/button_controller/button_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _homeBloc = Modular.get<HomeBloc>();
  final ButtonBloc _buttonBloc = Modular.get<ButtonBloc>();
  int indexSelected = 0;

  @override
  void dispose() {
    super.dispose();
    _homeBloc.close();
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
            Expanded(flex: 7, child: Container(color: Colors.red)),
            Expanded(flex: 5, child: Container(color: Colors.black)),
            Expanded(flex: 3, child: Container(color: Colors.amber)),
            Expanded(
                child: BottomButtonOptions(
              buttons: List.generate(
                  3,
                  (index) => ButtonOptionsType(
                        onTap: () {
                          _buttonBloc
                              .add(ButtonEventChangeButton(index: index));
                        },
                        indexButton: index,
                      )),
            )),
          ],
        ),
      ),
    );
  }
}
