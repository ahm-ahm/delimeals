import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static final routeName = '/meal-detail';

final Function  toggleMeals;
final Function   isFavourite;
MealDetailScreen(this.toggleMeals,this.isFavourite);
  //same code
  buildSelectionTitle(BuildContext ctx, String name) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        name,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

//build same container for list
  buildContainer(Widget child) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.grey)),
      height: 150.0,
      width: 300.0,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200.0,
              child: Image.asset(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            //ingredients
            buildSelectionTitle(context, 'Ingredients'),
            //list of ingredients
            // Container(
            //   padding: const EdgeInsets.all(10.0),
            //   margin: const EdgeInsets.all(10.0),
            //   decoration: BoxDecoration(
            //       color: Colors.white, border: Border.all(color: Colors.grey)),
            //   height: 150.0,
            //   width: 300.0,
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            //steps heading via method
            buildSelectionTitle(context, 'Steps'),
            //list via build  container method
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //pop is used to go back,to send data of any type back ,to remove dialogue
          // Navigator.of(context).pop(mealId);
          toggleMeals(mealId);
        },
        // child: Icon(Icons.delete),
        child: Icon(isFavourite(mealId) ? Icons.star : Icons.star_border),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
