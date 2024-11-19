import 'package:core/app_config.dart';
import 'package:core/utils/logger.dart';
import 'package:dio/dio.dart';
import 'local_storage.dart';
import 'local_storage_keys.dart';

class NetworkClient {
  late final Dio _dio;
  final LocalStorage _localStorage;

  NetworkClient(AppConfig appConfig, this._localStorage) {
    _dio = Dio(
      BaseOptions(
        baseUrl: appConfig.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          AppLogger.info('Request: ${options.method} ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          AppLogger.info('Response: ${response.statusCode} ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          AppLogger.error('Error: ${e.response?.statusCode} ${e.message}');
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> getRequest(
    String path, {
    bool requiresAuthentication = false,
  }) async {
    try {
      final options = requiresAuthentication
          ? Options(
              headers: {
                'authorization':
                    await _localStorage.getString(StringKey.tokenKey),
              },
            )
          : null;

      final response = await _dio.get(path, options: options);
      return response;
    } on DioException catch (e) {
      AppLogger.error('GET request error: ${e.message}');
      rethrow;
    }
  }

  Future<Response> postRequest(
    String path,
    Map<String, dynamic> data, {
    bool requiresAuthentication = false,
  }) async {
    try {
      final options = requiresAuthentication
          ? Options(
              headers: {
                'authorization':
                    await _localStorage.getString(StringKey.tokenKey),
              },
            )
          : null;

      final response = await _dio.post(path, data: data, options: options);
      return response;
    } on DioException catch (e) {
      AppLogger.error('POST request error: ${e.message}');
      rethrow;
    }
  }

  Future<Response> putRequest(
    String path,
    Map<String, dynamic> data, {
    bool requiresAuthentication = false,
  }) async {
    try {
      final options = requiresAuthentication
          ? Options(
              headers: {
                'authorization':
                    await _localStorage.getString(StringKey.tokenKey),
              },
            )
          : null;

      final response = await _dio.put(path, data: data, options: options);
      return response;
    } on DioException catch (e) {
      AppLogger.error('PUT request error: ${e.message}');
      rethrow;
    }
  }

  Future<Response> deleteRequest(
    String path, {
    bool requiresAuthentication = false,
  }) async {
    try {
      final options = requiresAuthentication
          ? Options(
              headers: {
                'authorization':
                    await _localStorage.getString(StringKey.tokenKey),
              },
            )
          : null;

      final response = await _dio.delete(path, options: options);
      return response;
    } on DioException catch (e) {
      AppLogger.error('DELETE request error: ${e.message}');
      rethrow;
    }
  }
}
