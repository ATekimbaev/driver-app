import 'package:dio/dio.dart';
import 'package:driver/core_data/consts_data/consts_data.dart';
import 'package:driver/feature/registration/models/token_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioSettings {
  DioSettings() {
    setup();
  }

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.driver.kg/api/v1/',
      contentType: 'application/json',
      headers: {
        'Accept': 'application/json',
      },
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  void setup() async {
    final interceptors = dio.interceptors;

    final prefs = await SharedPreferences.getInstance();

    interceptors.clear();

    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] =
              'Bearer ${prefs.getString(AppConsts.accesToken)}';

          return handler.next(options);
        },
        onError: (e, handler) async {
          if (e.response?.statusCode == 401) {
            final response = await dio.post('accounts/refresh/',
                data: {"refresh": prefs.getString(AppConsts.refreshToken)});
            final result = TokenModel.fromJson(response.data);
            prefs.setString(AppConsts.accesToken, result.access ?? '');
            prefs.setString(AppConsts.refreshToken, result.refresh ?? '');
            return handler.resolve(response);
          }
        },
      ),
    );

    final logInterceptor = LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );

    final headerInterceptors = QueuedInterceptorsWrapper(
      onRequest: (options, handler) => handler.next(options),
      onError: (DioError error, handler) {
        handler.next(error);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
    );
    interceptors.addAll([if (kDebugMode) logInterceptor, headerInterceptors]);
  }
}
