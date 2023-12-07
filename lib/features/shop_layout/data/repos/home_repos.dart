import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shop_aoo/core/utilits/dio.dart';
import 'package:shop_aoo/core/utilits/my_cashe.dart';
import 'package:shop_aoo/core/utilits/my_cashe_keys.dart';
import 'package:shop_aoo/features/shop_layout/data/home_model/home_model.dart';

class HomeRepo {
  Future<dynamic> getHomeData() async {
    try {
      Response response = await MyDio.getData(
          endPoint: 'home',
          lang: 'en',
          token: MyCache.getString(key: MyCacheKeys.userToken));
      return HomeModel.fromJson(response.data);
    } catch (error) {
      if (kDebugMode) {
        print('error is $error');
      }
      return error.toString();
    }
  }
}
