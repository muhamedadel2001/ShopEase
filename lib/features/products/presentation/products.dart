import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_aoo/features/products/presentation/view/widgets/products_body_builder.dart';
import 'package:shop_aoo/features/shop_layout/manager/layout_cubit.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        if (state is GetHomeDataLoading || state is CategoriesGetDataLoading||state is GetFavLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.deepPurple,
          ));
        }
        if (state is GetHomeDataSuccess ||
            state is CategoriesGetDataSuccess ||
            state is LayoutChangeBottomNavigationBar ||
            state is AddOrDeleteFav ||
            state is AddOrDeleteFavFirst||state is GetProfileSuccess||state is GetFavSuccess) {
          return ProductsBodyBuilder(
            model: LayoutCubit.get(context).homeModel,
            model2: LayoutCubit.get(context).categoriesModel,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
