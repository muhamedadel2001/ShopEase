import 'package:flutter/material.dart';
import 'package:shop_aoo/core/utilits/my_cashe.dart';
import 'package:shop_aoo/core/utilits/my_cashe_keys.dart';
import 'package:shop_aoo/core/utilits/screens.dart' as screens;
import 'package:shop_aoo/features/auth/login/presentation/view/login_screen.dart';
import 'package:shop_aoo/features/on_boarding/presentation/view/on_boarding_screen.dart';
import 'package:shop_aoo/features/shop_layout/presentation/view/home_layout.dart';
import 'package:shop_aoo/features/search/presentation/view/search.dart';

class AppRouter {
  static final AppRouter router = AppRouter();
  late Widget startScreen;
  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = MyCache.getString(key: MyCacheKeys.userToken) == ''
        ? const LoginScreen()
        : const HomeLayOut();
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case screens.homeLayOut:
        return MaterialPageRoute(builder: (_) => const HomeLayOut());
      case screens.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
    }
  }
}
