import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_aoo/features/categories/data/model/categories_model.dart';
import 'package:shop_aoo/features/products/presentation/view/widgets/Categories_item.dart';
import 'package:shop_aoo/features/products/presentation/view/widgets/product_item.dart';
import 'package:shop_aoo/features/shop_layout/data/home_model/home_model.dart';
import 'package:shop_aoo/features/shop_layout/manager/layout_cubit.dart';

class ProductsBodyBuilder extends StatefulWidget {
  final HomeModel model;
  final CategoriesModel model2;
  const ProductsBodyBuilder(
      {super.key, required this.model, required this.model2, });

  @override
  State<ProductsBodyBuilder> createState() => _ProductsBodyBuilderState();
}

class _ProductsBodyBuilderState extends State<ProductsBodyBuilder> {
  late LayoutCubit cubit;
  @override
  void initState() {
    super.initState();

    cubit=LayoutCubit.get(context);
  }
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
  builder: (context, state) {
    if(widget.model.data!=null){
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: widget.model.data!.banners!
                  .map((e) => Image(
                image: NetworkImage('${e.image}'),
                fit: BoxFit.cover,
                width: double.infinity,
              ))
                  .toList(),
              options: CarouselOptions(
                  reverse: false,
                  enlargeCenterPage: true,
                  height: 250,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  initialPage: 0,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 0.85),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoriesItems(
                              dataList:
                              cubit.categoriesModel.data!.data![index]

                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        itemCount:
                        cubit.categoriesModel.data!.data!.length


                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'New Products',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.6,
                children: List.generate(
                    widget.model.data!.products!.length,
                        (index) =>
                        ProductItem(products: widget.model.data!.products![index])),
              ),
            ),
          ],
        ),
      );
    }
    else{
      return const Center(child: CircularProgressIndicator());
    }

  },
);
  }
}
