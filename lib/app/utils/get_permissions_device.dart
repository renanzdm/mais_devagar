import 'package:flutter_modular/flutter_modular.dart';
import 'package:location/location.dart';

class GetPermissionsDevice {
  final Location _homeModule = Modular.get<Location>();

  Future<bool> getPermission() async {
    bool serviceEnabled;
    PermissionStatus permission;
    _homeModule.enableBackgroundMode(enable: true);

    serviceEnabled = await _homeModule.serviceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await _homeModule.requestPermission();
    if (permission == PermissionStatus.denied) {
      permission = await _homeModule.requestPermission();
      if (permission == PermissionStatus.denied) {
        return false;
      }
    }

    if (permission == PermissionStatus.deniedForever) {
      return false;
    }

    if (permission == PermissionStatus.granted) {
      return true;
    }
    return false;
  }
}
