import 'package:flutter/material.dart';
import 'package:shop_aoo/features/categories/data/model/categories_model.dart';

class CategoriesItems extends StatelessWidget {
  final DataList dataList;
  const CategoriesItems( {super.key, required this.dataList, });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image(
              image: NetworkImage(
               dataList.image.toString()
              ),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )),
        Container(
          color: Colors.black.withOpacity(0.8),
          width: 100,
          child: Text(
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            '${dataList.name}',
            style: const TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
