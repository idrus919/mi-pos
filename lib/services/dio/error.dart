import 'package:dio/dio.dart';

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r, Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    String message = response?.statusMessage ?? 'Invalid request';
    dynamic data = response?.data;
    if (data is Map) {
      if (data.containsKey('message')) {
        message = data['message'];
      }
    }
    return message;
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r, Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    String message = response?.statusMessage ??
        'Unknown error occurred, please try again later';
    dynamic data = response?.data;
    if (data is Map) {
      if (data.containsKey('message')) {
        message = data['message'];
      }
    }
    return message;
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r, Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    String message = response?.statusMessage ?? 'Conflict occurred';
    dynamic data = response?.data;
    if (data is Map) {
      if (data.containsKey('message')) {
        message = data['message'];
      }
    }
    return message;
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r, Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    String message = response?.statusMessage ?? 'Access denied';
    dynamic data = response?.data;
    if (data is Map) {
      if (data.containsKey('message')) {
        message = data['message'];
      }
    }
    return message;
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r, Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    String message = response?.statusMessage ??
        'The requested information could not be found';
    dynamic data = response?.data;
    if (data is Map) {
      if (data.containsKey('message')) {
        message = data['message'];
      }
    }
    return message;
  }
}

class MethodNotAllowedException extends DioError {
  MethodNotAllowedException(RequestOptions r, Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    String message = response?.statusMessage ?? 'Method not allowed';
    dynamic data = response?.data;
    if (data is Map) {
      if (data.containsKey('message')) {
        message = data['message'];
      }
    }
    return message;
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r, Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    String message = response?.statusMessage ??
        'No internet connection detected, please try again';
    dynamic data = response?.data;
    if (data is Map) {
      if (data.containsKey('message')) {
        message = data['message'];
      }
    }
    return message;
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r, Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    String message = response?.statusMessage ??
        'The connection has timed out, please try again';
    dynamic data = response?.data;
    if (data is Map) {
      if (data.containsKey('message')) {
        message = data['message'];
      }
    }
    return message;
  }
}
