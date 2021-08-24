import 'package:flutter/material.dart';
import 'distance_widget.dart';
import 'elapsed_time.dart';

class InformationDisplayWidget extends StatelessWidget {
  const InformationDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: DistanceWidget()),
            SizedBox(
              width: 4,
            ),
            Expanded(child: ElapsedTimeWidget()),
          ],
        ),
        Row(
          children: [
            Expanded(child: DistanceWidget()),
            SizedBox(
              width: 4,
            ),
            Expanded(child: DistanceWidget()),
          ],
        ),
      ],
    );
  }
}
