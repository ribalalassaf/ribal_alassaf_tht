import 'package:intl/intl.dart';
import 'package:ribal_alassaf_tht/utils/enums.dart';

class MonitoringRequestParams {
  DateTime? date;
  MonitoringType? type;
  MonitoringRequestParams({this.date, this.type});

  Map<String, dynamic> toJson() {
    return {
      'date': DateFormat("yyyy-MM-dd").format(date!),
      'type': type!.name,
    };
  }
}
