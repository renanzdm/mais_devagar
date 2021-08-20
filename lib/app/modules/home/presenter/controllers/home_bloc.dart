import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mais_devagar/app/modules/home/presenter/controllers/home_event.dart';
import 'package:mais_devagar/app/modules/home/presenter/controllers/home_state.dart';
import 'package:mais_devagar/app/modules/home/presenter/usecases/i_velocity_user_usecase.dart';
import 'package:mais_devagar/app/modules/home/utils/getPermissionsDevice.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState, this.iVelocityUserUsecase)
      : super(HomeStateInitial());
  final IVelocityUserUsecase iVelocityUserUsecase;
  final GetPermissionsDevice getPermissionsDevice = GetPermissionsDevice();

  StreamSubscription? _velocitySubscription;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeEventGetVelocity) {
      yield* _mapGetVelocity();
    } else if (event is HomeEventUpdateVelocityUser) {
      yield* _mapUpdateVelocity(event);
    }else if(event is HomeEventError){
      yield* _mapEventError(event);
    }
  }

  Stream<HomeState> _mapGetVelocity() async* {
    _velocitySubscription?.cancel();
    await getPermissionsDevice.getPermission();
    _velocitySubscription = iVelocityUserUsecase.getVelocity().listen((event) =>
        add(HomeEventUpdateVelocityUser(location: event)))
      ..onError((err) {
        add(HomeEventError(error: err.toString()));
      });
  }

  Stream<HomeState> _mapUpdateVelocity(
      HomeEventUpdateVelocityUser event) async*{
      yield HomeStateSuccess(position: event.location);
  }

  Stream<HomeState> _mapEventError(HomeEventError eventError)async*{
    yield HomeStateError(error: eventError.error);
  }

  @override
  Future<void> close() {
    _velocitySubscription?.cancel();
    return super.close();
  }
}
