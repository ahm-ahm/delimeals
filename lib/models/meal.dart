//to select options
import 'package:flutter/material.dart';

enum Complexity { Simple, Challanging, Hard }

enum Affordability { Affordable, Pricy, Luxurious }

class Meal {
  //id of meal
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity; //it is easy or hard to make
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVeganFree;
  final bool isVegetarian;

 const Meal({
      @required this.id,
      @required this.categories,
      @required this.title,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVeganFree,
      @required this.isVegetarian});
}
