import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mais_devagar/app/modules/core/utils/app_colors.dart';
import 'package:mais_devagar/app/modules/core/utils/sizes.dart';
import 'package:mais_devagar/app/modules/splash/controller/splash_bloc.dart';
import 'package:mais_devagar/app/modules/splash/controller/splash_event.dart';
import 'package:mais_devagar/app/modules/splash/controller/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final SplashBloc _splashBloc = Modular.get<SplashBloc>();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      upperBound: 10.0,
      lowerBound: 1.0,
    );
    _animationController.reverse(from: 10.0);
    Future.delayed(const Duration(seconds: 3), () async {
      _splashBloc.add(SplashEventGetConfigModel());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocListener<SplashBloc, SplashState>(
        bloc: _splashBloc,
        listener: (context, state) {
          if (state is SplashStateFirstAccess) {
            Modular.to.pushReplacementNamed('/introduction');
          } else if (state is SplashStateNotFirstAccess) {
            Modular.to.pushReplacementNamed('/home');
          }
        },
        child: Container(
          height: Sizes.maxHeight(context),
          width: Sizes.maxWidth(context),
          color: AppColors.darkBlue,
          child: LogoAnimation(_animationController),
        ),
      ),
    );
  }
}

class LogoAnimation extends AnimatedWidget {
  LogoAnimation(Animation<double> _animation) : super(listenable: _animation);
  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      alignment: Alignment.center,
      scale: animation,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/speedometer.png',
              scale: 8,
            ),
            Text(
              'SPEED METER',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
