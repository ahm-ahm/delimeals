import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static final routeName = '/filters';

  final Map<String, bool> currentFilters;
//privete cant be used in named optional parameter but always public

//to create function
  final Function saveFilters;

  const FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isLactoloseFree = false;

  _buildSwitchListTile(
      {String title,
      String subTitle,
      bool currentValue,
      Function updateValue}) {
    print('current value $currentValue');
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

//to init ,because after applying the filters  the  whole filters remain uncheched when new meals are loaded again
  @override
  void initState() {
    _isGlutenFree = widget.currentFilters['gluten'];
    _isVegan = widget.currentFilters['vegan'];

    _isLactoloseFree = widget.currentFilters['lactose'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              setState(() {
                final selectedFilters = {
                  'gluten': _isGlutenFree,
                  'vegan': _isVegan,
                  'lactose': _isLactoloseFree,
                  'vegetarian': _isVegetarian,
                };
                print('the selected gluten${selectedFilters['gluten']}');
                print('the selected lactor${selectedFilters['lactose']}');
                print('the selected vegan ${selectedFilters['vegan']}');
                print(
                    'the selected vegetarian${selectedFilters['vegetarian']}');
                widget.saveFilters(selectedFilters);
              });
            },
          )
        ],
        title: Text('Your Filters'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                    title: 'Gluten-Free',
                    subTitle: 'Only includes Gluten-Free meals',
                    currentValue: _isGlutenFree,
                    updateValue: (isSelectedValue) {
                      setState(() {
                        print('the selected gluten value is $isSelectedValue');
                        _isGlutenFree = isSelectedValue;
                      });
                    }),
                _buildSwitchListTile(
                    title: 'Vegan',
                    subTitle: 'Only includes Vegan meals',
                    currentValue: _isVegan,
                    updateValue: (isSelectedValue) {
                      setState(() {
                        print('the vegan is $_isVegan');
                        _isVegan = isSelectedValue;
                      });
                    }),
                _buildSwitchListTile(
                    title: 'Lactolose-Free',
                    subTitle: 'Only includes Lactose-Free meals',
                    currentValue: _isLactoloseFree,
                    updateValue: (isSelectedValue) {
                      setState(() {
                        print(
                            'the selected lactolose value is $isSelectedValue');
                        _isLactoloseFree = isSelectedValue;
                      });
                    }),
                _buildSwitchListTile(
                    title: 'Vegetarian',
                    subTitle: 'Only includes Vegetarian meals',
                    currentValue: _isVegetarian,
                    updateValue: (isSelectedValue) {
                      setState(() {
                        print(
                            'the selected vegeterian value is $isSelectedValue');

                        _isVegetarian = isSelectedValue;
                      });
                    }),
              ],
            ),
          )
        ],
      ),
      //if drawer is not used ,by default ,back arrow <- is used  .To use hamburg icon use formulated drawer
      drawer: MainDrawer(),
    );
  }
}
