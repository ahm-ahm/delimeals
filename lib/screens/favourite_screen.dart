import 'package:deli_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';


class FavouriteScreen extends StatelessWidget {
  final List<Meal> _favouriteMeals;
  FavouriteScreen(this._favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (_favouriteMeals.isEmpty)
      return Center(
        child: Text('You have no Favourites yet-start adding some!'),
      );
      else 
      return ListView.builder(
        // itemBuilder: (context, index) => Text(categoryMeal[index].title),
        itemBuilder: (context, index) => MealItem(
          id: _favouriteMeals[index].id,
          title: _favouriteMeals[index].title,
          imageUrl: _favouriteMeals[index].imageUrl,
          duration: _favouriteMeals[index].duration,
          complexity: Complexity.Challanging,
          affordability: Affordability.Luxurious,
        ),
        itemCount: _favouriteMeals.length,
      );
  }
}
