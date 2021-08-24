import 'dart:math';

class TakeDistance {
  static double takeDistance(lat1, long1, lat2, lon2) {
    var p = pi / 180;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - long1) * p)) / 2;
    return 12742 * asin(sqrt(a)) * 1000;
  }
}
