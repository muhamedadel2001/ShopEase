import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shop_aoo/core/utilits/dio.dart';
import 'package:shop_aoo/core/utilits/my_cashe.dart';
import 'package:shop_aoo/core/utilits/my_cashe_keys.dart';
import 'package:shop_aoo/features/search/data/search_model.dart';

class SearchRepo {
  Future<dynamic> getSearch({required String text}) async {
    try {
      Response response = await MyDio.postData(
          endPoint: 'products/search',
          data: {
            'text': text,
          },
          token:
              MyCache.getString(key: MyCacheKeys.userToken),
          lang: 'en');
      return SearchModel.fromJson(response.data);
    } catch (err) {
      if (kDebugMode) {
        print('error is $err');
      }
    }
  }
}
