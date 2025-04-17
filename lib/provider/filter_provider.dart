import "package:flutter_riverpod/flutter_riverpod.dart";

import "meal_provider.dart";

enum Filters {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian
}

class FiltersNotifier extends StateNotifier<Map<Filters,bool>>{
  FiltersNotifier(): super({
    Filters.glutenFree:false,
    Filters.lactoseFree:false,
    Filters.vegan:false,
    Filters.vegetarian:false
  });

  void setFilter(Filters filter, bool isActive){
    state = {...state , filter:isActive};
  }

  void setFilters(Map<Filters,bool> chosenFilters){
    state = chosenFilters;
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier,Map<Filters,bool>>((ref){
  return FiltersNotifier();
});

final filteredMealProvider = Provider((ref){
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal){
    if(activeFilters[Filters.vegetarian]! && !meal.isVegetarian){
      return false;
    }
    if(activeFilters[Filters.vegan]! && !meal.isVegan){
      return false;
    }
    if(activeFilters[Filters.lactoseFree]! && !meal.isLactoseFree){
      return false;
    }
    if(activeFilters[Filters.glutenFree]! && !meal.isGlutenFree){
      return false;
    }
    return true;
  }).toList();
});