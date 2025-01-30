import 'package:injectable/injectable.dart';
import 'package:ribal_alassaf_tht/features/monitoring/data/datasources/monitoring_datasource.dart';
import 'package:ribal_alassaf_tht/features/monitoring/domain/models/monitoring_data_model.dart';
import 'package:ribal_alassaf_tht/features/monitoring/domain/models/monitoring_request_params.dart';
import 'package:ribal_alassaf_tht/features/monitoring/domain/repositories/monitoring_repo_abstract.dart';
import 'package:ribal_alassaf_tht/utils/base_api_repository.dart';
import 'package:ribal_alassaf_tht/utils/data_state.dart';

@LazySingleton(as: MonitoringRepoAbstract)
class MonitoringRepoImpl extends BaseApiRepository implements MonitoringRepoAbstract {
  final MonitoringDatasource _monitoringDatasource;
  MonitoringRepoImpl(this._monitoringDatasource);

  @override
  Future<DataState<List<MonitoringDataModel>>> getMonitoringData(MonitoringRequestParams params) async {
    return sendRequest(request: _monitoringDatasource.getMonitoringData(params));
  }
}
