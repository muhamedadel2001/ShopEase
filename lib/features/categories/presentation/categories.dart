import 'package:flutter/material.dart';
import 'package:shop_aoo/features/categories/presentation/view/widgets/categories_details_item.dart';
import 'package:shop_aoo/features/shop_layout/manager/layout_cubit.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return CategoriesDetailsItem(
              dataList:
                  LayoutCubit.get(context).categoriesModel.data!.data![index],
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 0.5,
            );
          },
          itemCount:
              LayoutCubit.get(context).categoriesModel.data!.data!.length),
    );
  }
}
