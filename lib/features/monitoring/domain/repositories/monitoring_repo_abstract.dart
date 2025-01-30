import 'package:ribal_alassaf_tht/features/monitoring/domain/models/monitoring_data_model.dart';
import 'package:ribal_alassaf_tht/features/monitoring/domain/models/monitoring_request_params.dart';
import 'package:ribal_alassaf_tht/utils/data_state.dart';

abstract class MonitoringRepoAbstract {
  Future<DataState<List<MonitoringDataModel>>> getMonitoringData(MonitoringRequestParams params);
}
