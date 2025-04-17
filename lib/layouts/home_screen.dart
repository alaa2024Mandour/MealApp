import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/widgets/category_item.dart';

import '../models/meal.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.availableMeal});
  final List<Meal> availableMeal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemBuilder: (BuildContext context, int index) => CategoryItem(
          category: availableCategories[index],
          availableMeal: availableMeal,
          ),
        itemCount: availableCategories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 3/2
        ),
      ),
    );
  }
}
