import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart' as dio_package;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../core/utils/dio_singleton.dart';

Future generalApi({
  required final String method,
  required final String url,
  final data,
  final Map<String, dynamic>? queryParam,
  final Map<String, dynamic>? header,
  final bool isLogin = false,
  final responseTypeIsByte = false,
  final bool logoutWhenTokenIsInvalid = true,
  final ProgressCallback? onSendProgress,
  final bool returnResponseOnError = false,
}) async {
  Dio? dio;
  dio = DioSingleton.getInstance(isLogin);
  dio!.options.method = method.toLowerCase();
  if (header != null) {
    dio.options.headers = header;
  }

  if (kDebugMode) {
    print('${method.toLowerCase()}: ${dio.options.baseUrl}$url');
    print(dio.options.headers);
    if (data != null) {
      log('Data sent: $data');
    }
  }

  try {
    final dio_package.Response response = await dio.request(
      url,
      data: data,
      queryParameters: queryParam,
      options:
          responseTypeIsByte ? Options(responseType: ResponseType.bytes) : null,
      onSendProgress: onSendProgress,
    );

    if (kDebugMode) {
      log('Status code: ${response.statusCode}');
      log('Data received: ${response.data}');
    }

    return response;
  } catch (e) {
    if (e is dio_package.DioException) {
      if (kDebugMode) {
        log(e.response.toString());
      }

      if (e.response == null) {
        rethrow;
      }
      if (returnResponseOnError) {
        return e.response;
      }

      // if (logoutWhenTokenIsInvalid &&
      //     (e.response!.statusCode == 401 || e.response!.statusCode == 403)) {
      //   clearLocalStorage();
      //   Future.delayed(
      //     Duration.zero,
      //         () {
      //       AppNavigation.router.goNamed(NavigationRoutes.login);
      //     },
      //   );
      // }
    } else {
      rethrow;
    }
  }
}
