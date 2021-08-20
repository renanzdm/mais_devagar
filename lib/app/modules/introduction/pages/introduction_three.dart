import 'package:flutter/material.dart';

class IntroductionThree extends StatelessWidget {
  IntroductionThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/intro_three.png'),
            Text(
              '''Basta voce configura-lo, com a velocidade maxima que voce quer atingir, para isso ele rodará em segundo plano
              ''',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
            )
          ],
        ),
      ),
    );
  }
}
