import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/layouts/meal_screen.dart';
import 'package:meal_app/models/meal.dart';

import '../models/category.dart';
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final Category category; 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {
        final List<Meal> filteredMeal = dummyMeals.where((meal)=>meal.categories.contains(category.id)).toList();
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => MealScreen(
                  title: category.title,
                  meals: filteredMeal,
                ),
            )
        );
      },
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.54),
                category.color.withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          )
        ),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          )
      ),
    );
  }
}
