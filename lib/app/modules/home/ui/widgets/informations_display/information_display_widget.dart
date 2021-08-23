import 'package:flutter/material.dart';
import 'package:mais_devagar/app/modules/home/ui/widgets/informations_display/distance_widget.dart';

class InformationDisplayWidget extends StatelessWidget {
  const InformationDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: DistanceWidget()),
        SizedBox(
          width: 4,
        ),
        Expanded(child: DistanceWidget()),
        SizedBox(
          width: 4,
        ),
        Expanded(child: DistanceWidget()),
      ],
    );
  }
}
