import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mais_devagar/app/modules/core/utils/app_colors.dart';

import 'controller/button_bloc.dart';
import 'controller/button_state.dart';

class ButtonOptionsType extends StatelessWidget {
  final int indexButton;
  final IconData icon;
  final ButtonBloc _buttonBloc;

  final VoidCallback onTap;

  ButtonOptionsType(
      {required this.indexButton, required this.onTap, required this.icon})
      : _buttonBloc = Modular.get<ButtonBloc>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Column(
            children: [
              BlocBuilder<ButtonBloc, ButtonState>(
                bloc: _buttonBloc,
                builder: (context, state) {
                  if (state is ButtonStateUpdated) {
                    if (state.index == indexButton) {
                      return Expanded(
                        child: Icon(
                          icon,
                          size: 25,
                          color: AppColors.pink,
                        ),
                      );
                    }
                    return Expanded(
                      child: Icon(
                        icon,
                        size: 25,
                        color: Colors.grey.shade800,
                      ),
                    );
                  }
                  return Expanded(
                    child: Icon(
                      icon,
                      size: 25,
                      color: Colors.grey.shade800,
                    ),
                  );
                },
              ),
              BlocBuilder<ButtonBloc, ButtonState>(
                bloc: _buttonBloc,
                builder: (context, state) {
                  if (state is ButtonStateUpdated) {
                    if (state.index == indexButton) {
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.pink,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black38,
                                offset: Offset(-5.0, -2.0),
                                blurRadius: 10,
                                spreadRadius: 2)
                          ],
                        ),
                        height: 4,
                      );
                    } else {
                      return SizedBox();
                    }
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
