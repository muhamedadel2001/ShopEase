import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_aoo/features/favourites/presentation/view/widgets/favourites_item_screen.dart';
import 'package:shop_aoo/features/shop_layout/manager/layout_cubit.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    LayoutCubit.get(context).getFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        if (LayoutCubit.get(context).getFavouritesModel.data==null||state is GetFavLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            body: ListView.separated(
                itemBuilder: (context, index) {
                  return FavouritesItemScreen(
                    model: LayoutCubit.get(context)
                        .getFavouritesModel
                        .data!
                        .data![index]
                        .product!,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Divider(
                      height: 0.3,
                    ),
                  );
                },
                itemCount: LayoutCubit.get(context)
                    .getFavouritesModel
                    .data!
                    .data!
                    .length),
          );
        }
      },
    );
  }
}
