import 'package:dio/dio.dart';
import 'package:ribal_alassaf_tht/utils/data_state.dart';

abstract class BaseApiRepository {
  Future<DataState<T>> sendRequest<T>({required Future<T> request}) async {
    try {
      final T response = await request;
      return DataSuccess(response);
    } on DioException catch (e) {
      String? message;
      message = _getErrorMessage(e.type);

      return DataFailure(e.copyWith(message: message));
    }
  }

  String _getErrorMessage(DioExceptionType e) {
    switch (e) {
      case DioExceptionType.connectionTimeout:
        return 'The connection timed out. Please check your internet connection and try again.';
      case DioExceptionType.sendTimeout:
        return 'The request timed out while sending data. Please try again later.';
      case DioExceptionType.receiveTimeout:
        return 'The server took too long to respond. Please try again.';
      case DioExceptionType.cancel:
        return 'The request was canceled. Please try again.';
      case DioExceptionType.connectionError:
        return 'A connection error occurred. Please check your internet connection and try again.';
      case DioExceptionType.unknown:
        return 'An unknown error occurred. Please try again later.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}
