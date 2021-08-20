import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'controller/button_controller/button_bloc.dart';
import 'controller/button_controller/button_state.dart';

class ButtonOptionsType extends StatelessWidget {
  final int indexButton;

  final VoidCallback onTap;

  ButtonOptionsType({required this.indexButton, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Icon(
                  FontAwesomeIcons.mapMarkedAlt,
                  size: 18,
                ),
              ),
              BlocBuilder<ButtonBloc, ButtonState>(
                bloc: Modular.get<ButtonBloc>(),
                builder: (context, state) {
                  if (state is ButtonStateUpdated) {
                    if (state.index == indexButton) {
                      return Container(
                        height: 5,
                        color: Colors.red,
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
