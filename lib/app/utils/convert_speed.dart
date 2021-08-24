class ConvertSpeed {
  static String converMetterPerSecondsForKilometersPerHour(double value) {
    double valueConverted = value * 3.6;
    return valueConverted.toStringAsFixed(0);
  }
}
