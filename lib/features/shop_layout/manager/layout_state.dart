part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}

class LayoutChangeBottomNavigationBar extends LayoutState {}

class GetHomeDataLoading extends LayoutState {}

class GetHomeDataSuccess extends LayoutState {}

class GetHomeDataFailed extends LayoutState {}

class CategoriesGetDataLoading extends LayoutState {}

class CategoriesGetDataSuccess extends LayoutState {}

class CategoriesGetDataFailed extends LayoutState {}

class AddOrDeleteFav extends LayoutState {
  final FavouriteModel model;

  AddOrDeleteFav(this.model);
}
class AddOrDeleteFavFirst extends LayoutState {}

class GetFavLoading extends LayoutState {}

class GetFavSuccess extends LayoutState {}

class GetFavFailed extends LayoutState {}

class GetProfileLoading extends LayoutState {}

class GetProfileSuccess extends LayoutState {}

class GetProfileFailed extends LayoutState {}

class PutProfileUpdateLoading extends LayoutState {}

class PutProfileUpdateSuccess extends LayoutState {}

class PutProfileUpdateFailed extends LayoutState {}
