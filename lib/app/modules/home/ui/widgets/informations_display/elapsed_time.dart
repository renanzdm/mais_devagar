import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mais_devagar/app/modules/core/utils/app_colors.dart';
import 'package:mais_devagar/app/modules/home/ui/widgets/informations_display/controllers/elapsed_time_cubit.dart';
import 'package:mais_devagar/app/utils/transform_elapsed_time.dart';

import 'controllers/elapsed_time_state.dart';

class ElapsedTimeWidget extends StatefulWidget {
  @override
  _ElapsedTimeWidgetState createState() => _ElapsedTimeWidgetState();
}

class _ElapsedTimeWidgetState extends State<ElapsedTimeWidget> {
  final ElapsedTimeCubit _elapsedTimeBloc = Modular.get<ElapsedTimeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ElapsedTimeCubit, ElapsedTimeState>(
      bloc: _elapsedTimeBloc,
      builder: (context, state) {
        if (state.milliseconds > 0) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 2),
            height: 80,
            child: Column(
              children: [
                Text(
                  'Tempo Decorrido',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Divider(
                  color: AppColors.darkBlue,
                  endIndent: 10,
                  indent: 10,
                ),
                Text(
                  TransformElapsedTime.formatTime(state.milliseconds),
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'DigitalNumber',
                      color: Colors.black),
                ),
              ],
            ),
          );
        } else {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 2),
            height: 80,
            child: Column(
              children: [
                Text(
                  'Tempo Decorrido',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Divider(
                  color: AppColors.darkBlue,
                  endIndent: 10,
                  indent: 10,
                ),
                Text(
                  TransformElapsedTime.formatTime(state.finalMilliseconds),
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'DigitalNumber',
                      color: Colors.black),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
