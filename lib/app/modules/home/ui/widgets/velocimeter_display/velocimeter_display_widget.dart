import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mais_devagar/app/modules/core/utils/sizes.dart';
import 'package:mais_devagar/app/modules/home/controllers/home_cubit.dart';
import 'package:mais_devagar/app/modules/home/controllers/home_state.dart';
import 'package:mais_devagar/app/utils/convert_speed.dart';

class VelocimeterDisplayWidget extends StatelessWidget {
  final HomeCubit _homeCubit = Modular.get<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: Sizes.maxWidth(context),
      child: Stack(
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            bloc: _homeCubit,
            builder: (context, state) {
              print(state);
              if (state.speed > 0.0) {
                return Container(
                  width: 300,
                  child: Text(
                    ConvertSpeed.converMetterPerSecondsForKilometersPerHour(
                        state.speed),
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
