import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ribal_alassaf_tht/features/monitoring/domain/models/monitoring_data_model.dart';
import 'package:ribal_alassaf_tht/features/monitoring/domain/models/monitoring_request_params.dart';
import 'package:ribal_alassaf_tht/features/monitoring/domain/repositories/monitoring_repo_abstract.dart';
import 'package:ribal_alassaf_tht/utils/data_state.dart';
import 'package:ribal_alassaf_tht/utils/enums.dart';

part 'monitoring_state.dart';
part 'monitoring_cubit.freezed.dart';

@Injectable()
class MonitoringCubit extends Cubit<MonitoringState> {
  final MonitoringRepoAbstract _monitoringRepo;
  MonitoringCubit(this._monitoringRepo) : super(const MonitoringState.initial());

  void getHouseConsumptionData(
    DateTime date,
  ) async {
    emit(const MonitoringState.inProgress());
    MonitoringRequestParams params = MonitoringRequestParams(type: MonitoringType.house_consumption, date: date);
    DataState dataState = await _monitoringRepo.getMonitoringData(params);
    if (dataState.isSuccess()) {
      emit(MonitoringState.success(dataState.data as List<MonitoringDataModel>));
    } else {
      emit(MonitoringState.failure((dataState.data as DioException).message!));
    }
  }

  void getBatteryConsumptionData(DateTime date) async {
    emit(const MonitoringState.inProgress());
    MonitoringRequestParams params = MonitoringRequestParams(type: MonitoringType.battery_consumption, date: date);
    DataState dataState = await _monitoringRepo.getMonitoringData(params);
    if (dataState.isSuccess()) {
      emit(MonitoringState.success(dataState.data as List<MonitoringDataModel>));
    } else {
      emit(MonitoringState.failure((dataState.data as DioException).message!));
    }
  }

  void getSolarGenerationData(DateTime date) async {
    emit(const MonitoringState.inProgress());
    MonitoringRequestParams params = MonitoringRequestParams(type: MonitoringType.solar_generation, date: date);
    DataState dataState = await _monitoringRepo.getMonitoringData(params);
    if (dataState.isSuccess()) {
      emit(MonitoringState.success(dataState.data as List<MonitoringDataModel>));
    } else {
      emit(MonitoringState.failure((dataState.data as DioException).message!));
    }
  }
}
