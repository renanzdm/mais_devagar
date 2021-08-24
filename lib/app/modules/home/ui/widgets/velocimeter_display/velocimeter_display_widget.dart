import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mais_devagar/app/modules/core/utils/sizes.dart';
import 'package:mais_devagar/app/modules/home/controllers/home_bloc.dart';
import 'package:mais_devagar/app/modules/home/controllers/home_state.dart';
import 'package:mais_devagar/app/utils/convert_speed.dart';

class VelocimeterDisplayWidget extends StatelessWidget {
  final HomeBloc _homeBloc = Modular.get<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: Sizes.maxWidth(context),
      child: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            bloc: _homeBloc,
            builder: (context, state) {
              if (state is HomeStateSuccessGetSpeed) {
                return Container(
                  width: 300,
                  child: Text(
                    ConvertSpeed.converMetterPerSecondsForKilometersPerHour(
                        state.position.speed ?? 0.0),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontFamily: 'DigitalNumber',
                      fontSize: 120,
                    ),
                  ),
                );
              }
              return SizedBox();
            },
          ),
          Container(
            width: 300,
            child: Text(
              '000',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontFamily: 'DigitalNumber',
                  fontSize: 120,
                  color: Colors.black12),
            ),
          ),
        ],
      ),
    );
  }
}
