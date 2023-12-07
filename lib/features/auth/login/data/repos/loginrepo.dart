import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shop_aoo/core/utilits/dio.dart';

import '../models/login_model.dart';

class LoginRepo {
  Future<dynamic> userLogin(dynamic data) async {
    try {
      Response response =
          await MyDio.postData(endPoint: 'login', data: data, lang: 'en');

      return LoginModel.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print('errorrrr$e');
      }
    }
  }
}
