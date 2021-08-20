import 'package:flutter/material.dart';

class IntroductionTwo extends StatelessWidget {
  IntroductionTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/intro_two.png'),
            Text(
              '''Speed Meter irá te ajudar a dirigir na velocidade certa''',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
            )
          ],
        ),
      ),
    );
  }
}
