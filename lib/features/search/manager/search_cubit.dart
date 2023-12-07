import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_aoo/features/search/data/search_model.dart';
import 'package:shop_aoo/features/search/data/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of<SearchCubit>(context);
  SearchModel searchModel = SearchModel();
  SearchRepo searchRepo = SearchRepo();
  GlobalKey<FormState>searchKey=GlobalKey();
  TextEditingController searchController=TextEditingController();
  Future<dynamic> getSearch({required String text}) async {
    emit(SearchLoading());
    searchRepo.getSearch(text: text).then((value) {
      searchModel = value;
      emit(SearchSuccess());
      return searchModel;
    }).catchError((err) {

      emit(SearchFailed());
      return searchModel;
    });
  }
}
