import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:mais_devagar/app/modules/home/services/geolocator_service.dart';
import 'package:mais_devagar/app/utils/get_permissions_device.dart';
import 'package:mais_devagar/app/utils/take_distance_covered.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(HomeState initialState, this.geolocatorService)
      : super(HomeState.initialState());
  final GeolocatorService geolocatorService;
  final GetPermissionsDevice getPermissionsDevice = GetPermissionsDevice();

  StreamSubscription? _velocitySubscription;
  double initLatitude = 0.0;
  double initLongitude = 0.0;
  double distanceTravelad = 0.0;

  Future<void> fetchLocation() async {
    bool permissionGranted = await getPermissionsDevice.getPermission();
    if (permissionGranted) {
      _velocitySubscription =
          geolocatorService.listenLocationUserDriver().listen((event) {
        distanceTravelad += TakeDistance.takeDistance(
            initLatitude, initLongitude, event.latitude, event.longitude);
        emit(HomeState.loadSuccess(
            speed: event.speed ?? 0.0, distance: distanceTravelad));
      })
            ..onError((err) {
              emit(HomeState.error(error: err));
            });
    }
  }

  Future<void> getInitDistance() async {
    LocationData locationDataInitial =
        await geolocatorService.getLocationUserDriver();
    initLatitude = locationDataInitial.latitude ?? 0.0;
    initLongitude = locationDataInitial.longitude ?? 0.0;
  }

  @override
  Future<void> close() {
    _velocitySubscription?.cancel();
    return super.close();
  }
}
