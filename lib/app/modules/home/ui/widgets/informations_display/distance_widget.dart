import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mais_devagar/app/modules/core/utils/app_colors.dart';
import 'package:mais_devagar/app/modules/home/controllers/home_bloc.dart';
import 'package:mais_devagar/app/modules/home/controllers/home_state.dart';

class DistanceWidget extends StatelessWidget {
  final HomeBloc _homeBloc = Modular.get<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: _homeBloc,
      builder: (context, state) {
        if (state is HomeStateSuccessGetSpeed) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 2),
            height: 80,
            child: Column(
              children: [
                Text(
                  'Distância',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Divider(
                  color: AppColors.darkBlue,
                  endIndent: 10,
                  indent: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: (state.distance / 1000).toStringAsFixed(1),
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'DigitalNumber',
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Km/h',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ]),
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
                  'Distância',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Divider(
                  color: AppColors.darkBlue,
                  endIndent: 10,
                  indent: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: '0.0',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'DigitalNumber',
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Km/h',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ]),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
