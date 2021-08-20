import 'package:mais_devagar/objectbox.g.dart';

class InitDatabaseLocal {
  InitDatabaseLocal._();
  static InitDatabaseLocal? _instance;
  static InitDatabaseLocal get instance => _instance ??= InitDatabaseLocal._();

  Future<Store> initStoresBox() async {
    return await openStore();
  }
}
