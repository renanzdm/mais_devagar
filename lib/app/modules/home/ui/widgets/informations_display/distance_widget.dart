import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mais_devagar/app/modules/home/presenter/controllers/home_bloc.dart';
import 'package:mais_devagar/app/modules/home/presenter/controllers/home_state.dart';

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
            child: Text(state.distance.toStringAsFixed(2)),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        } else {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 2),
            height: 80,
            child: Text(''),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        }
      },
    );
  }
}
