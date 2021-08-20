import 'package:flutter/material.dart';

class IntroductionOne extends StatelessWidget {
  const IntroductionOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SPEED METER',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                foreground: Paint()..style = PaintingStyle.stroke,
              ),
            ),
            Image.asset('assets/images/intro_one.png'),
            Text(
              '''Com ele voce pode monitorar sua velocidade em tempo real''',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
            )
          ],
        ),
      ),
    );
  }
}
