class MonitoringDataModel {
  final DateTime? time;
  final double? value;
  MonitoringDataModel({
    this.time,
    this.value,
  });

  factory MonitoringDataModel.fromJson(Map<String, dynamic> map) {
    return MonitoringDataModel(
      time: DateTime.parse(map['timestamp']),
      value: map['value'].toDouble(),
    );
  }
}
