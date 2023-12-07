import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_aoo/core/utilits/app_router.dart';
import 'package:shop_aoo/features/auth/login/manager/login_cubit.dart';
import 'package:shop_aoo/features/on_boarding/manager/on_boarding_cubit.dart';
import 'package:shop_aoo/features/shop_layout/manager/layout_cubit.dart';

import 'core/utilits/bloc_observer.dart';
import 'core/utilits/dio.dart';
import 'core/utilits/my_cashe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.initCache();
  Bloc.observer = MyBlocObserver();
  await MyDio.dioInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnBoardingCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(
            create: (context) => LayoutCubit()
              ..getHomeDataFromRepo()
              ..getDataCategories()
              ..getProfileData()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: AppRouter.router.onGenerateRoute),
    );
  }
}
