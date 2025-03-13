import 'package:flutter/material.dart';
import '../models/meal.dart';

 class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({

    super.key,
    required this.meal,
    required this.onToggleFavorites,
  });

  final Meal meal ;
  final Function(Meal meal) onToggleFavorites;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            meal.title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){ onToggleFavorites(meal);},
              icon: Icon(Icons.star)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
                meal.imageUrl,
              height: 300,
              fit: BoxFit.cover,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary
              ),
            ),
            const SizedBox(height: 10,),
            for (final element in meal.ingredients)
              Text(
                element,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
            SizedBox(height: 35,),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary
              ),
            ),
            const SizedBox(height: 10,),
            for (final element in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 16
                ),
                child: Text(
                  element,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
