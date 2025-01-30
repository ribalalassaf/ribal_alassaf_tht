part of 'monitoring_cubit.dart';

@freezed
class MonitoringState with _$MonitoringState {
  const factory MonitoringState.initial() = _Initial;
  const factory MonitoringState.inProgress() = _InProgress;
  const factory MonitoringState.failure(String message) = _Failure;
  const factory MonitoringState.success(List<MonitoringDataModel> points) = _Success;
}
