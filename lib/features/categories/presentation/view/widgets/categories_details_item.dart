import 'package:flutter/material.dart';
import 'package:shop_aoo/features/categories/data/model/categories_model.dart';

class CategoriesDetailsItem extends StatelessWidget {
  final DataList dataList;
  const CategoriesDetailsItem({super.key, required this.dataList, });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
              dataList.image.toString()  ),
            width: 100,
            height: 100,
          ),
          SizedBox(width: 20,),
          Text(dataList.name.toString(),style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
          Spacer(),
          Icon(Icons.arrow_forward)
        ],
      ),
    );
  }
}
