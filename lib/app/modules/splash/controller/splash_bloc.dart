import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mais_devagar/app/modules/core/models/config_model_box.dart';
import 'package:mais_devagar/app/modules/splash/controller/splash_event.dart';
import 'package:mais_devagar/app/modules/splash/controller/splash_state.dart';

import '../../../../objectbox.g.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(SplashState initialState) : super(SplashStateInitial());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    SplashState state = SplashState();
    switch (event.runtimeType) {
      case SplashEventGetConfigModel:
        state = await _verifyIsFirstAccess();
        break;
      default:
    }
    yield state;
  }

  Future<SplashState> _verifyIsFirstAccess() async {
    var configStore = Modular.get<Store>();
    var res = configStore.box<ConfigModelBox>();
    var results = res.getAll();
    if (results.isNotEmpty) {
      if (results.first.showIntroductionPages == false) {
        return SplashStateNotFirstAccess();
      }
    }
    return SplashStateFirstAccess();
  }
}
