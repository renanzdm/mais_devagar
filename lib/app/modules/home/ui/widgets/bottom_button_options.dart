import 'package:flutter/material.dart';
import 'package:mais_devagar/app/modules/core/utils/sizes.dart';
import 'package:mais_devagar/app/modules/home/ui/widgets/button_options_type.dart';

class BottomButtonOptions extends StatelessWidget {
  final List<ButtonOptionsType> buttons;

  const BottomButtonOptions({
    required this.buttons,
  }) : assert(buttons.length == 3, 'Deve ter tres botões');
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.maxWidth(context),
      child: Row(children: buttons),
    );
  }
}
