import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
          title: Text('Your Filters '),
      ),
      body: Column(
          spacing: 30,
          children: [
            listTile(
                context: context,
                title:'Gluten_Free',
                subTitle: 'only include gluten free meals',
                filter: activeFilters[Filters.glutenFree]!,
                onChange: (bool value) {
                  ref.read(filtersProvider.notifier).setFilter(Filters.glutenFree, value);
                }
            ),
            listTile(
                context: context,
                title:'Lactose_Free',
                subTitle: 'only include lactose free meals',
                filter: activeFilters[Filters.lactoseFree]!,
                onChange: (bool value) {
                  ref.read(filtersProvider.notifier).setFilter(Filters.lactoseFree, value);
                }
            ),
            listTile(
                context: context,
                title:'Vegan',
                subTitle: 'only include Vegan meals',
                filter: activeFilters[Filters.vegan]!,
                onChange: (bool value) {
                  ref.read(filtersProvider.notifier).setFilter(Filters.vegan, value);
                }
            ),
            listTile(
                context: context,
                title:'Vegetarian',
                subTitle: 'only include Vegetarian meals',
                filter: activeFilters[Filters.vegetarian]!,
                onChange: (bool value) {
                  ref.read(filtersProvider.notifier).setFilter(Filters.vegetarian, value);
                }
            ),
          ],
        ),
    );
  }
}


Widget listTile ({
  required context,
  required String title,
  required String subTitle,
  required bool filter,
  required Function(bool value) onChange,
}) => SwitchListTile(
  title: Text(
      title,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.secondary,
      )
  ),
  subtitle:Text(
      subTitle,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      )
  ),
  value: filter,
  onChanged: onChange,
  activeColor: Theme.of(context).colorScheme.tertiary,
  contentPadding: EdgeInsets.only(left: 34,right: 22),
);