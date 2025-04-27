import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/favoriets_provier.dart';
import '../models/meal.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favoritesMealProvider);

    bool isFav = favouriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoritesMealProvider.notifier)
                  .toggleMealFavStatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(wasAdded ? 'Add To Favorites Meals' : 'Removed From Favorites Meals')));
            },
            icon: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                transitionBuilder: (child,animation) {
                  return RotationTransition(
                    turns: Tween<double>(begin: 0.5,end: 1).animate(animation),
                    child: child,
                  );
                },
                child: Icon(
                    isFav ?Icons.star : Icons.star_border ,
                  color: isFav ? Colors.amber :  Colors.white70 ,
                  key: ValueKey(isFav),
                )
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl, height: 300, fit: BoxFit.cover),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),
            for (final element in meal.ingredients)
              Text(
                element,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            SizedBox(height: 35),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),
            for (final element in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 16,
                ),
                child: Text(
                  element,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
