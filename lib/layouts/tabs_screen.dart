import 'package:flutter/material.dart ';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/layouts/home_screen.dart';
import 'package:meal_app/layouts/meal_screen.dart';
import 'package:meal_app/widgets/drawer_main.dart';

import '../models/meal.dart';
import 'filters_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key });
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

const kInitialFitters = {
  Filters.glutenFree:false,
  Filters.lactoseFree:false,
  Filters.vegan:false,
  Filters.vegetarian:false
};

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }


  List<Meal> favoriteMeals = [];



  Map<Filters,bool> _selectedFitters = kInitialFitters;

  void _setScreen(String identifier) {
    if (identifier == 'Filters') {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FiltersScreen()),
      ).then((onValue) => setState(() {
        _selectedFitters= onValue?? kInitialFitters;
        })
      );
    }else{
      Navigator.pop(context);
    }
  }

  late List<Meal> availableMeals = [] ;

  void showSnakeBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavStatus(Meal meal) {
    final isExisting = favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        favoriteMeals.remove(meal);
      });
      showSnakeBar('Removed From Favorites Meals');
    } else {
      setState(() {
        favoriteMeals.add(meal);
      });
      showSnakeBar('Add To Favorites Meals');
    }
  }

  @override
  Widget build(BuildContext context) {

    availableMeals = dummyMeals.where((meal){
            if(_selectedFitters[Filters.vegetarian]! && !meal.isVegetarian){
              return false;
            }
            if(_selectedFitters[Filters.vegan]! && !meal.isVegan){
              return false;
            }
            if(_selectedFitters[Filters.lactoseFree]! && !meal.isLactoseFree){
              return false;
            }
            if(_selectedFitters[Filters.glutenFree]! && !meal.isGlutenFree){
              return false;
            }
            return true;
    }).toList();

    @override

    Widget activeScreen =  HomeScreen(onToggleFavorites: _toggleMealFavStatus, availableMeal: availableMeals,);
    return Scaffold(
      appBar: AppBar(title: Text( _selectedPageIndex == 0 ? 'Categorise' : "Favorites")),
      drawer: DrawerMain(onSelectScreen: _setScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectedPageIndex = index;
          if(_selectedPageIndex == 0){
            activeScreen = HomeScreen(onToggleFavorites: _toggleMealFavStatus, availableMeal: availableMeals,);
          }else{
            activeScreen =  MealScreen(
              title: '',
              meals: favoriteMeals,
              onToggleFavorites: _toggleMealFavStatus,
            );
          }
        },
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}
