import '../screens/categories_screen.dart';
import '../screens/favourite_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
class TabsScreen extends StatefulWidget {

  final  _favouriteMeals;
  TabsScreen(this._favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // final List<Widget> _pages = [
    // CategoriesScreen(),
    // FavouriteScreen(),
  // ]; //to use the appbar name as title on clicking the every  item  in the appbar,use map
   List<Map<String, Object>> _pages;
  int selectedPageInddex=0;

  _selectPage(int index) {
    setState(() {
      selectedPageInddex = index;
    });
  }
@override
  void initState() {
    _pages= [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavouriteScreen(widget._favouriteMeals),
      'title': 'Your Favourites',
    },
  ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPageInddex]['title']),
      ),
      body: _pages[selectedPageInddex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favourites'),
          )
        ],
        selectedItemColor: Colors.yellowAccent,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPageInddex,
        type: BottomNavigationBarType.fixed,
      ),
      //add drawer
      drawer: MainDrawer(),
    );
  }
}
