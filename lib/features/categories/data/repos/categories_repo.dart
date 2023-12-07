import 'package:dio/dio.dart';
import 'package:shop_aoo/core/utilits/dio.dart';
import 'package:shop_aoo/features/categories/data/model/categories_model.dart';

class CategoriesRepo {
  Future<dynamic> getDataCategories() async {
    try {
      Response response =
          await MyDio.getData(endPoint: 'categories', lang: 'en');
      return CategoriesModel.fromJson(response.data);
    } catch (err) {
      print('eeeer$err');
    }
  }
}
