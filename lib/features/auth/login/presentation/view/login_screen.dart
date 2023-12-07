import 'package:flutter/material.dart';
import 'package:shop_aoo/features/auth/login/presentation/view/widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:  LoginScreenBody(),
    );
  }
}
