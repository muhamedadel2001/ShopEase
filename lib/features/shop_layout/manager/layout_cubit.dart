import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_aoo/core/utilits/dio.dart';
import 'package:shop_aoo/core/utilits/my_cashe.dart';
import 'package:shop_aoo/core/utilits/my_cashe_keys.dart';
import 'package:shop_aoo/features/favourites/data/models/favourite_model.dart';
import 'package:shop_aoo/features/favourites/data/models/get_favourites_model.dart';
import 'package:shop_aoo/features/favourites/data/repos/favourite_repo.dart';
import 'package:shop_aoo/features/settings/data/user_model/user_model.dart';
import 'package:shop_aoo/features/settings/data/user_repo/user_repo.dart';
import 'package:shop_aoo/features/shop_layout/data/home_model/home_model.dart';
import 'package:shop_aoo/features/shop_layout/data/repos/home_repos.dart';
import 'package:shop_aoo/features/categories/presentation/categories.dart';
import 'package:shop_aoo/features/favourites/presentation/favourites.dart';
import 'package:shop_aoo/features/products/presentation/products.dart';
import 'package:shop_aoo/features/settings/presentation/view/settings.dart';
import '../../categories/data/model/categories_model.dart';
import '../../categories/data/repos/categories_repo.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of<LayoutCubit>(context);
  HomeModel homeModel = HomeModel();
  HomeRepo homeRepo = HomeRepo();
  CategoriesRepo categoriesRepo = CategoriesRepo();
  CategoriesModel categoriesModel = CategoriesModel();
  FavouriteModel favouriteModel = FavouriteModel();
  FavouritesRepo favouritesRepo = FavouritesRepo();
  UserModel userModel=UserModel();
  UserRepo userRepo=UserRepo();
  GetFavouritesModel getFavouritesModel = GetFavouritesModel();
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  GlobalKey<FormState>globalKey=GlobalKey();

  Map<int, bool> favourites = {};
  int currIndex = 0;
  List<Widget> pages = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
  void changeBottomNav(int index) {
    currIndex = index;
    emit(LayoutChangeBottomNavigationBar());
  }

  Future<dynamic> getHomeDataFromRepo() async {
    emit(GetHomeDataLoading());
    await homeRepo.getHomeData().then((value) {
      emit(GetHomeDataSuccess());
      homeModel = value;
      homeModel.data!.products!.forEach((element) {
        favourites.addAll({
          element.id!.toInt(): element.inFavorites!,
        });
      });

      return homeModel;
    }).catchError((error) {

      return homeModel;
    });
  }

  Future<dynamic> getDataCategories() async {
    emit(CategoriesGetDataLoading());
    await categoriesRepo.getDataCategories().then((value) {
      categoriesModel = value;

      emit(CategoriesGetDataSuccess());
      return categoriesModel;
    }).catchError((onError) {
      emit(CategoriesGetDataFailed());

      return categoriesModel;
    });
  }

  Future<dynamic> addOrDeleteFavouriteFromRepo({required int id}) async {
    favourites[id] = !favourites[id]!;
    emit(AddOrDeleteFavFirst());
    await favouritesRepo.addOrDeleteFavourite(id).then((value) {
      favouriteModel = value;
      if (!favouriteModel.status!) {
        favourites[id] = !favourites[id]!;
      }
      emit(AddOrDeleteFav(favouriteModel));
    });

  }

  Future<dynamic> getFavourites() async {
    emit(GetFavLoading());
    await favouritesRepo.getFavourites().then((value) {
      emit(GetFavSuccess());
      getFavouritesModel = value;
      return getFavouritesModel;
    });

  }
  Future<dynamic> getProfileData() async {
    emit(GetProfileLoading());
    await userRepo.getProfileData().then((value) {
      emit(GetProfileSuccess());
      userModel = value;
      return userModel;
    });
  }
  Future<dynamic> updateData({required String name,required String email,required String phone}) async {
    emit(PutProfileUpdateLoading());
    await MyDio.putData(endPoint: 'update-profile', data: {
      'name':name,
      'phone':phone,
      'email':email,
    },token: MyCache.getString(key: MyCacheKeys.userToken),).then((value) {
      emit(PutProfileUpdateSuccess());
      getProfileData();
    });
    
  }

}
