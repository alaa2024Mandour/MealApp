import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/meal.dart';
import 'meal_detail_screen.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.title,
    required this.meals,
  }
);

  final String? title;
  final List<Meal> meals;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title!),),
      body: ListView.builder(
          itemBuilder: (context,index) => MealItem(
            meal: meals[index],
            onSelectMeal: (Meal meal) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MealDetailScreen(
                  meal: meal,
                )
                ),
              );
            },
          ),
        itemCount: meals.length,
      )
    );
  }
}
