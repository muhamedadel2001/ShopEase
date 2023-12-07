import 'package:dio/dio.dart';
import 'package:shop_aoo/core/utilits/constants.dart';

class MyDio {
  static Dio? dio;
  static dioInit() {
    dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Content-Type': 'application/json',
          }),
    );
  }

  static Future<Response> getData(
      {required String endPoint,
      Map<String, dynamic>? query,
      String lang = 'ar',
      String token = ''}) async {
    dio!.options.headers = {
      'Authorization': token,
      'lang': lang,
    };
    return await dio!.get(
      endPoint,
      queryParameters: query,
    );
  }

  static Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? query,
      required Map<String, dynamic>? data,
      String lang = 'ar',
      String token = ''}) async {
    dio!.options.headers = {'lang': lang, 'Authorization': token};
    return await dio!.post(endPoint,
        queryParameters: query,
        data: data,
        options: Options(validateStatus: (_) => true));
  }
  static Future<Response> putData(
      {required String endPoint,
        Map<String, dynamic>? query,
        required Map<String, dynamic>? data,
        String lang = 'en',
        String token = ''}) async {
    dio!.options.headers = {'lang': lang, 'Authorization': token};
    return await dio!.put(endPoint,
        queryParameters: query,
        data: data,
        options: Options(validateStatus: (_) => true));
  }
}
