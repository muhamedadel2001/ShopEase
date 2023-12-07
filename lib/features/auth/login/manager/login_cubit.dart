import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_aoo/core/utilits/my_cashe.dart';
import 'package:shop_aoo/core/utilits/my_cashe_keys.dart';
import 'package:shop_aoo/features/auth/login/data/models/login_model.dart';
import 'package:shop_aoo/features/auth/login/data/repos/loginrepo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);
  LoginModel loginModel = LoginModel();
  GlobalKey<FormState> globalKey = GlobalKey();
  LoginRepo loginRepo = LoginRepo();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  IconData visibility = Icons.visibility;
  bool isHidden = true;
  void changeSuffix() {
    isHidden = !isHidden;
    if (isHidden) {
      visibility = Icons.visibility;
    } else {
      visibility = Icons.visibility_off;
    }
    emit(ClickOnSuffix());
  }

  Future<dynamic> userLog() async {
    emit(LoginLoading());
    await loginRepo.userLogin({
      'email': textEditingControllerEmail.text,
      'password': textEditingControllerPassword.text
    }).then((value) {
      loginModel = value;
      if(loginModel.status==true){
        MyCache.setString(
            key: MyCacheKeys.userToken, value: loginModel.data!.token.toString());
      }
      emit(LoginSuccess());
      return loginModel;
    }).catchError((error) {
      emit(LoginFailed(error.toString()));
      return loginModel;
    });
  }
}
