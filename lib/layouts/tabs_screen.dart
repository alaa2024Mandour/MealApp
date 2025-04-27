import 'package:flutter/material.dart ';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/layouts/favorite_screen.dart';
import 'package:meal_app/layouts/home_screen.dart';
import 'package:meal_app/layouts/meal_screen.dart';
import 'package:meal_app/provider/navbar_Provider.dart';
import 'package:meal_app/widgets/drawer_main.dart';

import '../models/meal.dart';
import '../provider/favoriets_provier.dart';
import '../provider/filter_provider.dart';
import 'filters_screen.dart';

class TabsScreen extends ConsumerWidget {
   TabsScreen({super.key });


  List<Meal> favoriteMeals = [];


  @override
  Widget build(BuildContext context , WidgetRef ref) {
    @override

    int selectedPageIndex = ref.watch(navbarProvider);
    final availableMeals = ref.watch(filteredMealProvider);
    final List<Meal> _favoriteMeal = ref.watch(favoritesMealProvider);
    Widget activeScreen =  selectedPageIndex == 0
        ? HomeScreen(availableMeal: availableMeals)
        : MealScreen(meals: _favoriteMeal, title: '');

    return Scaffold(
      appBar: AppBar(title: Text( selectedPageIndex == 0 ? 'Categorise' : "Favorites")),
      drawer: DrawerMain(onSelectScreen: (String identifier){
        if (identifier == 'Filters') {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FiltersScreen()),
          );
        }else{
          Navigator.pop(context);
        }
      }),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          ref.read(navbarProvider.notifier).selectPage(index);
        },
        currentIndex: selectedPageIndex,
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
