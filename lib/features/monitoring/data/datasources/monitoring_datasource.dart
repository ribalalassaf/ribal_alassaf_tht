import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ribal_alassaf_tht/features/monitoring/domain/models/monitoring_data_model.dart';
import 'package:ribal_alassaf_tht/features/monitoring/domain/models/monitoring_request_params.dart';
import 'package:ribal_alassaf_tht/utils/urls.dart';

@LazySingleton()
class MonitoringDatasource {
  final Dio _cachingDio;
  MonitoringDatasource(@Named("caching") this._cachingDio);

  Future<List<MonitoringDataModel>> getMonitoringData(MonitoringRequestParams params) async {
    final response = await _cachingDio.get(monitoringUrl, queryParameters: params.toJson());
    return response.data.map<MonitoringDataModel>((element) => MonitoringDataModel.fromJson(element)).toList();
  }
}
