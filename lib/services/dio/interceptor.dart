import 'package:dio/dio.dart';
import 'package:mi_pos/services/dio/error.dart';

class AppInterceptors extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions, err.response);
      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions, err.response);
          case 401:
            throw UnauthorizedException(err.requestOptions, err.response);
          case 404:
            throw NotFoundException(err.requestOptions, err.response);
          case 405:
            throw MethodNotAllowedException(err.requestOptions, err.response);
          case 409:
            throw ConflictException(err.requestOptions, err.response);
          case 500:
            throw InternalServerErrorException(
              err.requestOptions,
              err.response,
            );
          default:
            throw err.response?.data;
        }
      case DioErrorType.cancel:
        throw NoInternetConnectionException(err.requestOptions, err.response);
      case DioErrorType.connectionTimeout:
        throw NoInternetConnectionException(err.requestOptions, err.response);
      case DioErrorType.badCertificate:
        throw NoInternetConnectionException(err.requestOptions, err.response);
      case DioErrorType.connectionError:
        throw NoInternetConnectionException(err.requestOptions, err.response);
      case DioErrorType.unknown:
        throw NoInternetConnectionException(err.requestOptions, err.response);
    }
  }
}
