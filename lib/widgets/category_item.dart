import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem({this.id, this.title, this.color});

  selectCategory(BuildContext ctx) {
    Navigator.pushNamed(ctx, '/categories-meals',
        arguments: {'id': id, 'title': title});
    //3--- // ctx, MaterialPageRoute(builder: (_) => CategoryMealsScreens(id,title)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: TextStyle(
              fontFamily: 'RobotoCondesed', fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
