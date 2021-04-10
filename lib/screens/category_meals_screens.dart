import 'package:deli_meals/models/meal.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

//when we remove item,state is changed so change stateless to stateful  widget
class CategoryMealsScreens extends StatefulWidget {
//we wanna receive data from switches so make constructor here
  final List<Meal> availableMeals;
  // const CategoryMealsScreens({Key key, this.availableMeals}) : super(key: key);
  CategoryMealsScreens(this.availableMeals);
  //-----------------
  // final  String categoryId;
  // final  String categoryTitle;

  // CategoryMealsScreens(this.categoryId,this.categoryTitle);

  @override
  _CategoryMealsScreensState createState() => _CategoryMealsScreensState();
}

class _CategoryMealsScreensState extends State<CategoryMealsScreens> {
  String categoryTitle;
  List<Meal> displayedMeals;

//when init doen't works use did dependencies,by applying checks
  bool _loadInitData = false;

  removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
//-----2
      final routeArg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArg['id'];
      categoryTitle = routeArg['title'];
//to get the every item
      // displayedMeals = DUMMY_MEALS
      //     .where((meal) => meal.categories.contains(categoryId))
      //     .toList();
      ///we use now available meals instead  of DUMMY_MEALS
      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      // body: Text('this is $categoryTitle page'),this is replaced via list
      body: ListView.builder(
        // itemBuilder: (context, index) => Text(categoryMeal[index].title),
        itemBuilder: (context, index) => MealItem(
          id: displayedMeals[index].id,
          title: displayedMeals[index].title,
          imageUrl: displayedMeals[index].imageUrl,
          duration: displayedMeals[index].duration,
          complexity: Complexity.Challanging,
          affordability: Affordability.Luxurious,
          // removeItem: removeMeal,
        ),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
