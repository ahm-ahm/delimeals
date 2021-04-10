import 'package:flutter/material.dart';

import '../screens/filters_screen.dart'; 
class MainDrawer extends StatelessWidget {
/*
-------------------process of router/navigator------------- 

create string in the widget where you wanna go.
create navigator  where you  wanna go from.
in the main ,use router via creation
*/
  buildListTile(IconData icon, String title, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26.0,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24.0,
            //fontWeight.bold=w700
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            width: double.infinity,
            padding: const EdgeInsets.all(30.0),
            // alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          buildListTile(Icons.restaurant, 'Meals', () {
            //pushReplacementNamed is used to avoid more pages adding in stack
            //replacing pages  instead of of pushing
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile(Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
