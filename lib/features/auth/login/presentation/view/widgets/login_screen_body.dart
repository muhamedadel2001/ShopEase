import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_aoo/core/widgets/defaultButton.dart';
import 'package:shop_aoo/core/widgets/helper_function.dart';
import 'package:shop_aoo/features/auth/login/manager/login_cubit.dart';
import 'package:shop_aoo/core/utilits/screens.dart' as screens;

class LoginScreenBody extends StatelessWidget {
  // Data model;
  const LoginScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: LoginCubit.get(context).globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'login now to browse our hot offers',
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller:
                        LoginCubit.get(context).textEditingControllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email cant be empty !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return TextFormField(
                        controller: LoginCubit.get(context)
                            .textEditingControllerPassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: LoginCubit.get(context).isHidden,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: InkWell(
                                onTap: () {
                                  LoginCubit.get(context).changeSuffix();
                                },
                                child:
                                    Icon(LoginCubit.get(context).visibility)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password cant be empty !';
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.deepPurple[400],
                          ),
                        );
                      } else {
                        return SizedBox(
                            width: double.infinity,
                            child: DefaultButton(
                                text: 'login',
                                onPressed: ()  {
                                  if (LoginCubit.get(context)
                                      .globalKey
                                      .currentState!
                                      .validate()) {
                                     LoginCubit.get(context).userLog();
                                    if (LoginCubit.get(context)
                                            .loginModel
                                            .status ==
                                        true) {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          screens.homeLayOut, (route) => false);
                                      HelperFunction.flutterToast(context,
                                          message: LoginCubit.get(context)
                                              .loginModel
                                              .message
                                              .toString(),
                                          color: Colors.green);
                                    }
                                    if (LoginCubit.get(context)
                                            .loginModel
                                            .status ==
                                        false) {
                                      HelperFunction.flutterToast(context,
                                          message: LoginCubit.get(context)
                                              .loginModel
                                              .message
                                              .toString(),
                                          color: Colors.red);
                                    }
                                  }
                                }));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t Have an account?'),
                      TextButton(
                          onPressed: () {
                          },
                          child: const Text('Register Now !'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
