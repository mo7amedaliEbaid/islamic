import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../app/error/failure.dart';
import '../../app/resources/resources.dart';


class ErrorHandler implements Exception {
  late ServerFailure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSource.unknown.getServerFailure();
    }
  }
}

ServerFailure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectionTimeout:
      return DataSource.connectTimeout.getServerFailure();
    case DioErrorType.sendTimeout:
      return DataSource.sendTimeout.getServerFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.receiveTimeOut.getServerFailure();
    case DioErrorType.badCertificate:
      return DataSource.unauthorized.getServerFailure();
    case DioErrorType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ServerFailure(
            error.response!.statusCode!, error.response!.statusMessage!);
      } else {
        return DataSource.unknown.getServerFailure();
      }
    case DioErrorType.cancel:
      return DataSource.cancel.getServerFailure();
    case DioErrorType.connectionError:
      return DataSource.noInternetConnection.getServerFailure();
    case DioErrorType.unknown:
      return DataSource.unknown.getServerFailure();
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeOut,
  sendTimeout,
  cacheError,
  noInternetConnection,
  unknown
}

extension DataSourceExtention on DataSource {
  ServerFailure getServerFailure() {
    switch (this) {
      case DataSource.success:
        return ServerFailure(ResponseCode.success, ResponseMessage.success);
      case DataSource.noContent:
        return ServerFailure(ResponseCode.noContent, ResponseMessage.noContent);
      case DataSource.badRequest:
        return ServerFailure(
            ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return ServerFailure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return ServerFailure(
            ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case DataSource.notFound:
        return ServerFailure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return ServerFailure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return ServerFailure(
            ResponseCode.connectTimeout, ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return ServerFailure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeOut:
        return ServerFailure(
            ResponseCode.receiveTimeOut, ResponseMessage.receiveTimeOut);
      case DataSource.sendTimeout:
        return ServerFailure(
            ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return ServerFailure(
            ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return ServerFailure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSource.unknown:
        return ServerFailure(ResponseCode.unknown, ResponseMessage.unknown);
    }
  }
}

class ResponseCode {
  static const int success = 200; //success with data
  static const int noContent = 201; //success with no data
  static const int badRequest = 400; //failure, API rejected request
  static const int unauthorized = 401; //failure, user is not authorized
  static const int forbidden = 403; //failure, API rejected request
  static const int notFound = 404;
  static const int internalServerError = 500; //failure, crash in server side

  //local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeOut = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int unknown = -7;
}

extension ResponseCodeExtension on int {
  ServerFailure getServerFailureFromCode() {
    if (this == ResponseCode.success) {
      return DataSource.success.getServerFailure();
    } else if (this == ResponseCode.noContent) {
      return DataSource.noContent.getServerFailure();
    } else if (this == ResponseCode.badRequest) {
      return DataSource.badRequest.getServerFailure();
    } else if (this == ResponseCode.unauthorized) {
      return DataSource.unauthorized.getServerFailure();
    } else if (this == ResponseCode.forbidden) {
      return DataSource.forbidden.getServerFailure();
    } else if (this == ResponseCode.notFound) {
      return DataSource.notFound.getServerFailure();
    } else if (this == ResponseCode.internalServerError) {
      return DataSource.internalServerError.getServerFailure();
    }

    //local status code
    else if (this == ResponseCode.connectTimeout) {
      return DataSource.connectTimeout.getServerFailure();
    } else if (this == ResponseCode.cancel) {
      return DataSource.cancel.getServerFailure();
    } else if (this == ResponseCode.receiveTimeOut) {
      return DataSource.receiveTimeOut.getServerFailure();
    } else if (this == ResponseCode.sendTimeout) {
      return DataSource.sendTimeout.getServerFailure();
    } else if (this == ResponseCode.cacheError) {
      return DataSource.cacheError.getServerFailure();
    } else if (this == ResponseCode.noInternetConnection) {
      return DataSource.noInternetConnection.getServerFailure();
    } else {
      return DataSource.unknown.getServerFailure();
    }
  }
}

class ResponseMessage {
  static String success = AppStrings.success.tr(); //success with data
  static String noContent = AppStrings.noContent.tr(); //success with no data
  static String badRequest =
      AppStrings.badRequest.tr(); //failure, API rejected request
  static String unauthorized =
      AppStrings.unauthorized.tr(); //failure, user is not authorized
  static String forbidden =
      AppStrings.forbidden.tr(); //failure, API rejected request
  static String notFound = AppStrings.notFound.tr();
  static String internalServerError =
      AppStrings.internalServerError.tr(); //failure, crash in server side

  //local status message
  static String connectTimeout = AppStrings.connectTimeout.tr();
  static String cancel = AppStrings.cancel.tr();
  static String receiveTimeOut = AppStrings.receiveTimeOut.tr();
  static String sendTimeout = AppStrings.sendTimeout.tr();
  static String cacheError = AppStrings.cacheError.tr();
  static String noInternetConnection = AppStrings.noInternetConnection.tr();
  static String unknown = AppStrings.unknown.tr();
}

class ApiInternalStatus {
  static const int success = 200;
  static const int failure = 404;
}
