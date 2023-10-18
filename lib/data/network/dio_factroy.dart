import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/utils/app_prefs.dart';
import '../../app/utils/constants.dart';
import '../../di/di.dart';

const String contentType = "content-type";
const String applicationJson = "application/json";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLanguage = "language";

class DioFactory {
  final AppPreferences _preferences = instance<AppPreferences>();

  Future<Dio> getDio() async {
    Dio dio = Dio();
    String language = await _preferences.getAppLanguage();

    Map<String, dynamic> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: Constants.token,
      defaultLanguage: language
    };
    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        sendTimeout: Constants.timeOut,
        receiveTimeout: Constants.timeOut);

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
