import 'package:dio/dio.dart';

import '../config/app_const.dart';

class Network {
  static Dio dioClient() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(seconds: 40),
    );
    final Dio dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(onRequest: (option, handle) async {
      return handle.next(option);
    }, onError: (DioException e, handler) async {
      // 401 unauthorized indication
      if (e.response?.statusCode == 401) {}
      return handler.next(e);
    }));
    dio.interceptors.add(LogInterceptor(
        responseBody: true, requestBody: true, requestHeader: true));
    return dio;
  }

  static String errorMsgHandler =
      "Something happened. Please try again later. ";
  static Exception messageHandler(Exception error) {
    // Sentry.captureException(error);
    if (error is DioException) {
      if (AppConst.isDebuggable) {
        return Exception(error.message);
      } else {
        return Exception(
            "$errorMsgHandler\nError : ${error.response?.statusCode ?? "Unknown"}");
      }
    } else {
      if (AppConst.isDebuggable) {
        return error;
      } else {
        return Exception("$errorMsgHandler\nError : Internal");
      }
    }
  }
}

class UnauthorizedException implements Exception {}
