import 'package:dio/dio.dart';
import 'package:fresh_start/core/services/shared_preferences_service.dart';

class DioClient {
  static final Dio _dio = Dio();

  static Future<Dio> getInstance() async {
    final sharedPreferences = SharedPreferencesService();
    final token = await sharedPreferences.getAuthToken();

    _dio.options = BaseOptions(
      baseUrl: 'https://apimoviles-production.up.railway.app',
      connectTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(minutes: 5),
      validateStatus: (status) {
        return status! < 500;
      },
    );

    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }

    return _dio;
  }
}
