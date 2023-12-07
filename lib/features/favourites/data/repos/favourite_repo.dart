import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shop_aoo/core/utilits/dio.dart';
import 'package:shop_aoo/core/utilits/my_cashe.dart';
import 'package:shop_aoo/core/utilits/my_cashe_keys.dart';
import 'package:shop_aoo/features/favourites/data/models/favourite_model.dart';
import 'package:shop_aoo/features/favourites/data/models/get_favourites_model.dart';

class FavouritesRepo {
  Future<dynamic> addOrDeleteFavourite(int id) async {
    try{
      Response response = await MyDio.postData(
          token:
          MyCache.getString(key: MyCacheKeys.userToken),
          endPoint: 'favorites',
          lang: 'en',
          data: {
            'product_id': id,
          });
      return FavouriteModel.fromJson(response.data);
    }
    catch(error){
      if (kDebugMode) {
        print('error is ${error}');
      }
    }

  }
  Future<dynamic> getFavourites() async {
    try{
      Response response = await MyDio.getData(
          token:
          MyCache.getString(key: MyCacheKeys.userToken),
          endPoint: 'favorites',
          lang: 'en',
         );
      return GetFavouritesModel.fromJson(response.data);
    }
    catch(error){
      if (kDebugMode) {
        print('error is ${error}');
      }
    }

  }
}
