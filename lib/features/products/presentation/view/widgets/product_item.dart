import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_aoo/core/widgets/helper_function.dart';
import 'package:shop_aoo/features/shop_layout/data/home_model/home_model.dart';
import 'package:shop_aoo/features/shop_layout/manager/layout_cubit.dart';

class ProductItem extends StatefulWidget {
  final Products products;

  const ProductItem({
    super.key,
    required this.products,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LayoutCubit, LayoutState>(
      listener: (context, state) {
        if (state is AddOrDeleteFav) {
          if (!state.model.status!) {
            HelperFunction.flutterToast(context,
                message: state.model.message.toString(), color: Colors.red);
          } else {
            HelperFunction.flutterToast(context,
                message: state.model.message.toString(), color: Colors.green);
          }
        }
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(widget.products.images![0]),
                  width: double.infinity,
                  height: 200,
                ),
                widget.products.discount != 0
                    ? Container(
                        color: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: const Text(
                          'Discount',
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        ),
                      )
                    : Container()
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.products.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.products.price.toString(),
                        style: const TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (widget.products.discount != 0)
                        Text(widget.products.oldPrice.toString(),
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough)),
                      const Spacer(),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            LayoutCubit.get(context)
                                .addOrDeleteFavouriteFromRepo(
                                    id: widget.products.id!.toInt());
                          },
                          icon: BlocBuilder<LayoutCubit, LayoutState>(
                            builder: (context, state) {
                              if (LayoutCubit.get(context)
                                      .favourites[widget.products.id] ==
                                  true) {
                                return const Icon(
                                  Icons.favorite,
                                  size: 14,
                                  color: Colors.red,
                                );
                              } else {
                                return const Icon(
                                  Icons.favorite,
                                  size: 14,
                                );
                              }
                            },
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
