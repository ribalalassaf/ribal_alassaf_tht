// ignore_for_file: constant_identifier_names

enum MonitoringType {
  solar_generation,
  house_consumption,
  battery_consumption,
}

enum MetricUnit {
  Watt,
  KiloWatt;

  @override
  String toString() {
    return name;
  }
}
