import 'package:dio/dio.dart';


class DioHelper
{
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
    // dio!.options.connectTimeout=5000;
    // dio!.options.receiveTimeout=3000;
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic>? query,
  }) async
  {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}