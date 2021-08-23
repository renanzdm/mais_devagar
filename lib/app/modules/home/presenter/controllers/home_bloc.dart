import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:mais_devagar/app/modules/home/presenter/controllers/home_event.dart';
import 'package:mais_devagar/app/modules/home/presenter/controllers/home_state.dart';
import 'package:mais_devagar/app/modules/home/presenter/usecases/i_velocity_user_usecase.dart';
import 'package:mais_devagar/app/utils/get_permissions_device.dart';
import 'package:mais_devagar/app/utils/take_distance_covered.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState, this.iVelocityUserUsecase)
      : super(HomeStateInitial());
  final ILocationUserUsecase iVelocityUserUsecase;
  final GetPermissionsDevice getPermissionsDevice = GetPermissionsDevice();
  final UtilsFunctions _utilsFunctions = UtilsFunctions();
  StreamSubscription? _velocitySubscription;
  double initLatitude = 0.0;
  double initLongitude = 0.0;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeEventGetVelocity) {
      yield* _mapGetVelocity();
    } else if (event is HomeEventUpdateVelocityUser) {
      yield* _mapUpdateVelocity(event);
    } else if (event is HomeEventError) {
      yield* _mapEventError(event);
    } else if (event is HomeEventGetInitLatAndLong) {
      yield* _mapGetInitLatAndLong();
    }
  }

  Stream<HomeState> _mapGetVelocity() async* {
    _velocitySubscription?.cancel();
    await getPermissionsDevice.getPermission();
    _velocitySubscription =
        iVelocityUserUsecase.listenLocation().listen((event) {
      add(HomeEventUpdateVelocityUser(
          location: event,
          distance: _utilsFunctions.takeDistance(
              initLatitude, initLongitude, event.latitude, event.longitude)));
    })
          ..onError((err) {
            add(HomeEventError(error: err.toString()));
          });
  }

  Stream<HomeState> _mapGetInitLatAndLong() async* {
    LocationData locationDataInitial = await iVelocityUserUsecase.getLocation();
    initLatitude = locationDataInitial.latitude ?? 0.0;
    initLongitude = locationDataInitial.longitude ?? 0.0;
    print(initLatitude);
    print(initLongitude);
    yield HomeStateGetInitLatAndLong();
  }

  Stream<HomeState> _mapUpdateVelocity(
      HomeEventUpdateVelocityUser event) async* {
    yield HomeStateSuccessGetSpeed(
        position: event.location, distance: event.distance);
  }

  Stream<HomeState> _mapEventError(HomeEventError eventError) async* {
    yield HomeStateError(error: eventError.error);
  }

  @override
  Future<void> close() {
    _velocitySubscription?.cancel();
    return super.close();
  }
}
