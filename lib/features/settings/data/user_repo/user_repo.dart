import 'package:dio/dio.dart';
import 'package:shop_aoo/core/utilits/dio.dart';
import 'package:shop_aoo/core/utilits/my_cashe.dart';
import 'package:shop_aoo/core/utilits/my_cashe_keys.dart';
import 'package:shop_aoo/features/settings/data/user_model/user_model.dart';

class UserRepo {
  Future<dynamic> getProfileData() async {
    try {
      Response response = await MyDio.getData(
          endPoint: 'profile',
          token:
              MyCache.getString(key: MyCacheKeys.userToken),
          lang: 'en');
      return UserModel.fromJson(response.data);
    } catch (error) {
      print('error is${error.toString()} ');
    }
  }
}
