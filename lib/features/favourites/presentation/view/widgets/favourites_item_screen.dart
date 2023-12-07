import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shop_layout/manager/layout_cubit.dart';
class FavouritesItemScreen extends StatefulWidget {
  final  model;

  const FavouritesItemScreen({super.key, required this.model});

  @override
  State<FavouritesItemScreen> createState() => _FavouritesItemScreenState();
}

class _FavouritesItemScreenState extends State<FavouritesItemScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 120,
            child: Row(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image(
                      image: NetworkImage(
                          widget.model.image.toString()),
                      width: 120,
                      height: 120,
                    ),

                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.model.name.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            widget.model.price.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Spacer(),
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () async {
                                await LayoutCubit.get(context)
                                    .addOrDeleteFavouriteFromRepo(
                                    id: widget.model.id!.toInt());
                                await LayoutCubit.get(context).getFavourites();
                              },
                              icon: BlocBuilder<LayoutCubit, LayoutState>(
                                builder: (context, state) {
                                  if (LayoutCubit.get(context)
                                      .favourites[widget.model.id] ==
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
      },
    );
  }
}
