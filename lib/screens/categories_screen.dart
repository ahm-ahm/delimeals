import '../widgets/category_item.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25.0),
      children: DUMMY_CATEGORIES
          .map((catData) => CategoryItem(
                id: catData.id,
                color: catData.color,
                title: catData.title,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        //height/width ratio=300/200 ie;1.5
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
      ),
    );
  }
}
