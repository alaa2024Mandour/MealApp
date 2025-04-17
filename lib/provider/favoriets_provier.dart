import "package:flutter_riverpod/flutter_riverpod.dart";
import "../models/meal.dart";


class FavoritesMealNotifier extends StateNotifier<List<Meal>>{
  FavoritesMealNotifier(): super([]);

  bool toggleMealFavStatus(Meal meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
      // state.remove(meal);
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      // state.add(meal);
      state = [...state , meal];
      return true;
    }
  }
}

final favoritesMealProvider = StateNotifierProvider<FavoritesMealNotifier,List<Meal>>((ref){
  return FavoritesMealNotifier();
});