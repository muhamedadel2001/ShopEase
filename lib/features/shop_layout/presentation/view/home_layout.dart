import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_aoo/features/shop_layout/manager/layout_cubit.dart';
import 'package:shop_aoo/core/utilits/screens.dart' as screens;

class HomeLayOut extends StatefulWidget {
  const HomeLayOut({super.key});

  @override
  State<HomeLayOut> createState() => _HomeLayOutState();
}

class _HomeLayOutState extends State<HomeLayOut> {
  @override

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple[400],
              title: const Text(
                'Store',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, screens.searchScreen);
                    },
                    icon: const Icon(Icons.search,color: Colors.white,))
              ],
            ),
            body: LayoutCubit.get(context)
                .pages[LayoutCubit.get(context).currIndex],
            bottomNavigationBar: BottomNavigationBar(
              showUnselectedLabels: true,
              selectedItemColor: Colors.deepPurple,
              unselectedItemColor: Colors.grey[400],
              unselectedLabelStyle: TextStyle(color: Colors.grey[400]),

              // backgroundColor: Colors.red,
              currentIndex: LayoutCubit.get(context).currIndex,
              onTap: (index) {
                LayoutCubit.get(context).changeBottomNav(index);
              },
              items: const [
                BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.home),
                    label: 'Home'),
                BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.grid_view),
                    label: 'Categories'),
                BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.favorite),
                    label: 'Favourites'),
                BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.settings),
                    label: 'Settings'),
              ],
            ),
          ),
        );
      },
    );
  }
}
