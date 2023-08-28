import 'package:dio/dio.dart';
import 'package:listview_with_flutter/networking/api_error.dart';
import 'package:listview_with_flutter/networking/configuration.dart';
import 'package:listview_with_flutter/networking/logging.dart';

class ApiProvider {
  late Dio _dio;

  ApiProvider() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiConfiguration.baseUrl,
      connectTimeout: ApiConfiguration.connectTimeout,
      receiveTimeout: ApiConfiguration.receiveTimeout,
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    _dio = Dio(options)..interceptors.add(Logging());
  }

  Future<Response> request({
    required String path,
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {

      Response response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(method: method),
      );
      return _response(response);
    } catch (e) {
      rethrow;
    }
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      default:
        throw APIError.fromJson(response.data);
    }
  }
}
