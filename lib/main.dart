import 'package:deli_meals/awesome_list2.dart';
import 'package:deli_meals/screens/category_meals_screens.dart';
import 'package:deli_meals/screens/meal_detail_screen.dart';
import './screens/favourite_screen.dart';
import './dummy_data.dart';
import 'package:deli_meals/screens/category_meals_screens.dart';
import './screens/filters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './models/meal.dart';

final Color darkBlue = Color.fromARGB(25, 34, 24, 45);

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //steps of switch logics
  // 1=adding logic of filters
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'lactose': false,
    'vegetarian': false,
  };
//2=get all meals,we got pointer here of meals
  List<Meal> _availableMeals = DUMMY_MEALS;
  //favourite meals
  List<Meal> _favouriteMeals=[];
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        if (_filters['vegan'] && !meal.isVeganFree) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

//add favourite logic
  _toggleFavourites(String mealId) {
    final existingMeal =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingMeal >= 0)
      setState(() {
        _favouriteMeals.removeAt(existingMeal);
      });
    else
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
  }

//to check the meal 
_isFavourite(String id){
  return _favouriteMeals.any((meal) =>  meal.id == id);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      // home:CategoriesScreen() ,
      //initialRoute is  optional
      initialRoute: '/',
      //-------1
      routes: {
        // '/': (context) => CategoriesScreen(), we wanna show tabbarscreen
        '/': (context) => TabsScreen(_favouriteMeals),
        '/categories-meals': (context) => CategoryMealsScreens(
              _availableMeals,
            ),
        //register the route in main
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavourites, _isFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}

//---------------------------------------------------------------------------------------
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final FixedExtentScrollController fixedExtentScrollController =
      new FixedExtentScrollController();

  final List<String> monthsOfTheYear = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    return listBuilder();
  }

//total list
  Widget totalList() {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('List'),
      //   elevation: 5,
      //   centerTitle: true,
      // ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                // color: Colors.greenAccent,
                child: ClipPath(
                  clipper: DiagonalPathClipperOne(),
                  child: Image.asset(
                    'assets/images/aw.jpg',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(500.0),
                  child: Image.asset(
                    'assets/images/6.jpg',
                    height: 60.0,
                    width: 60.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 100.0),
                child: Text(
                  'Ahmad Nawaz',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.purpleAccent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 100.0),
                child: Text(
                  'Flutter Learner',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent),
                ),
              ),
            ],
          ),
          Expanded(child: listScroll())
        ],
      ),
    );
  }

  //ListWheelScroll
  Widget listScroll() {
    return ListWheelScrollView(
      controller: fixedExtentScrollController,
      physics: FixedExtentScrollPhysics(),
      children: monthsOfTheYear.map((month) {
        return Row(
          children: <Widget>[
            ClipPath(
                clipper: WaveClipperTwo(),
                child: Image.asset('assets/images/aw.jpg')),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                month,
                style: TextStyle(fontSize: 18.0),
              ),
            )),
          ],
        );
      }).toList(),
      itemExtent: 80.0,
    );
  }

  //listView.builder with slider
  Widget listBuilder() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: ClipPath(
              clipper: SideCutClipper(),
              child: Image.asset('assets/images/b.jpg')),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: monthsOfTheYear.length,
              itemBuilder: (context, index) {
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actions: <Widget>[
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                    ),
                    IconSlideAction(
                      caption: 'Update',
                      color: Colors.blue,
                      icon: Icons.update,
                    )
                  ],
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Share',
                      color: Colors.green,
                      icon: Icons.share,
                    ),
                    IconSlideAction(
                      caption: 'Save',
                      color: Colors.pink,
                      icon: Icons.save,
                    )
                  ],
                  // child: InkWell(child: AwesomeList2(month: monthsOfTheYear [index]),
                  // onTap: (){
                  //   setState(() {
                  //       debugPrint('this is  ${monthsOfTheYear[index]}');
                  //   monthsOfTheYear.removeAt(index);

                  //   });

                  // },),
                  //if we use dismissible,slidable effects are overridden by Dismissible,it must not  be the part of tree
                  child: Dismissible(
                      key: Key(monthsOfTheYear[index]),
                      direction: DismissDirection.startToEnd,
                      // background:slideRightBackground() ,//so dont use it in tree
                      child: AwesomeList2(month: monthsOfTheYear[index])),
                );
              }),
        ),
      ],
    );
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " Edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
