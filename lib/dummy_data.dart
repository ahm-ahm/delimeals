import 'package:flutter/material.dart';
import './models/meal.dart';
import './models/category.dart';

const DUMMY_CATEGORIES = const [
  Category(
    id: 'c1',
    title: 'Italian',
    color: Colors.red,
  ),
  Category(
    id: 'c2',
    title: 'Quick & Ease',
    color: Colors.teal,
  ),
  Category(id: 'c3', title: 'BreakFast', color: Colors.blue),
  Category(
    id: 'c4',
    title: 'Exotic',
    color: Colors.pinkAccent,
  ),
  Category(
    id: 'c5',
    title: 'Light & Lovely',
    color: Colors.cyanAccent,
  ),
  Category(
    id: 'c6',
    title: 'Spicy',
    color: Colors.yellowAccent,
  ),
  Category(
    id: 'c7',
    title: 'Summer',
    color: Colors.green,
  ),
  Category(
    id: 'c8',
    title: 'German',
    color: Colors.purple,
  ),
  Category(
    id: 'c9',
    title: 'Asian',
    color: Colors.indigo,
  ),
  Category(
    id: 'c10',
    title: 'Hambburger',
    color: Colors.lightBlueAccent,
  ),
];

const DUMMY_MEALS = [
  Meal(
    id: 'm1',
    categories: [
      'c1',
    ],
    title: 'Spaghetti With Tomato sauce',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl: 'assets/images/aw.jpg',
    duration: 45,
    ingredients: [
      '1 TeaSpoon With Melted Butter',
      '2 TableSpoons of Sugar',
      '1 Large Egg Yolk',
      '2 Large Egg Whites',
          '1 Pinch Salt',
          '1 TableSpoon all_purpose Flour',
          '1 TeaSpoon With Melted Butter',
      '2 TableSpoons of Sugar',
      '1 Large Egg Yolk',
    ],
    steps: [     
      '1) Tenderize the veal to 2-4mm',
      '2) Salt on both sides',
      '3) Stir Eggs constantly with fork',
      '4) Make sure to toss the pane regularly',
      '5) The desired dish is ready',
    ],
    isGlutenFree: true,
    isLactoseFree: false,
    isVeganFree: false,
    isVegetarian: false,
  ),
  Meal(
    id: 'm2',
    categories: [
      'c2',
    ],
    title: 'Salted Rice With Tomato Sauce',
    affordability: Affordability.Affordable,
    complexity: Complexity.Challanging,
    imageUrl: 'assets/images/aw.jpg',
    duration: 45,
    ingredients: [
      '1 TeaSpoon With Melted Butter',
      '2 TableSpoons of Sugar',
      '1 Large Egg Yolk',
      '2 Large Egg Whites',
      '1 Pinch Salt',
      '1 TableSpoon all_purpose Flour',
      '1 TeaSpoon With Melted Butter',
      '2 TableSpoons of Sugar',
      '1 Large Egg Yolk',
    ],
    steps: [
      '1) Tenderize the veal to 2-4mm',
      '2) Salt on both sides',
      '3) Stir Eggs constantly with fork',
      '4) Make sure to toss the pane regularly',
      '5) The desired dish is ready',
    ],
    isGlutenFree: false,
    isLactoseFree: true,
    isVeganFree: false,
    isVegetarian: false,
  ),
  Meal(
    id: 'm3',
    categories: [
      'c7',
      'c6',
      'c3',
    ],
    title: 'Biryani With Mutton',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl: 'assets/images/aw.jpg',
    duration: 45,
    ingredients: [
      '1 TeaSpoon With Melted Butter',
      '2 TableSpoons of Sugar',
      '1 Large Egg Yolk',
      '2 Large Egg Whites',
      '1 Pinch Salt',
      '1 TableSpoon all_purpose Flour',
      '1 TeaSpoon With Melted Butter',
      '2 TableSpoons of Sugar',
      '1 Large Egg Yolk',
    ],
    steps: [
      '1) Tenderize the veal to 2-4mm',
      '2) Salt on both sides',
      '3) Stir Eggs constantly with fork',
      '4) Make sure to toss the pane regularly',
      '5) The desired dish is ready',
    ],
    isGlutenFree: false,
    isLactoseFree: false,
    isVeganFree: true,
    isVegetarian: false,
  ),
  Meal(
    id: 'm4',
    categories: [
      'c7',
      'c8',
      'c4',
    ],
    title: 'Beef Pillow',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl: 'assets/images/aw.jpg',
    duration: 45,
    ingredients: [
      '1 TeaSpoon With Melted Butter',
      '2 TableSpoons of Sugar',
      '1 Large Egg Yolk',
      '2 Large Egg Whites'
          '1 Pinch Salt'
          '1 TableSpoon all_purpose Flour'
          '1 TeaSpoon With Melted Butter',
      '2 TableSpoons of Sugar',
      '1 Large Egg Yolk',
    ],
    steps: [
      '1) Tenderize the veal to 2-4mm',
      '2) Salt on both sides',
      '3) Stir Eggs constantly with fork',
      '4) Make sure to toss the pane regularly',
      '5) The desired dish is ready',
    ],
    isGlutenFree: false,
    isLactoseFree: false,
    isVeganFree: false,
    isVegetarian: true,
  ),
  Meal(
    id: 'm5',
    categories: [
      'c5',
      'c9',
      'c10',
    ],
    title: 'Pillow  With Tomato sauce',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl: 'assets/images/aw.jpg',
    duration: 45,
    ingredients: [
      '1 TeaSpoon With Melted Butter',
      '2 TableSpoons of Sugar',
      '1 Large Egg Yolk',
      '2 Large Egg Whites',
          '1 Pinch Salt',
          '1 TableSpoon all_purpose Flour',
          '1 TeaSpoon With Melted Butter',
      '2 TableSpoons of Sugar',
      '1 Large Egg Yolk',
    ],
    steps: [
      '1) Tenderize the veal to 2-4mm',
      '2) Salt on both sides',
      '3) Stir Eggs constantly with fork',
      '4) Make sure to toss the pane regularly',
      '5) The desired dish is ready',
    ],
    isGlutenFree: false,
    isLactoseFree: false,
    isVeganFree: false,
    isVegetarian: true,
  ),
];