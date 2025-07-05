import 'package:dio/dio.dart';
import '../../core/routes/apis_routes.dart';

class DioSingleton {
  DioSingleton._internal();

  static Dio? _dio;

  static Dio? getInstance(final bool isLogin) {
    if (_dio == null || isLogin) {
      _dio = Dio(
        BaseOptions(
          baseUrl: Routes.baseUrl,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
          sendTimeout: const Duration(seconds: 30),
        ),
      );
    }

    return _dio;
  }
}
