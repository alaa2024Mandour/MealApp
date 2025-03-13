import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filters {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian
}

bool glutenFree = false;
bool lactoseFree = false;
bool vegan = false;
bool vegetarian = false;

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Your Filters '),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filters.glutenFree:glutenFree,
            Filters.lactoseFree:lactoseFree,
            Filters.vegan:vegan,
            Filters.vegetarian:vegetarian
          });
          return false;
        },
        child: Column(
          spacing: 30,
          children: [
            listTile(
                context: context,
                title:'Gluten_Free',
                subTitle: 'only include gluten free meals',
                filter: glutenFree,
                onChange: (bool value) {
                  setState(() {
                    glutenFree = value;
                  });
                }
            ),
            listTile(
                context: context,
                title:'Lactose_Free',
                subTitle: 'only include lactose free meals',
                filter: lactoseFree,
                onChange: (bool value) {
                  setState(() {
                    lactoseFree = value;
                  });
                }
            ),
            listTile(
                context: context,
                title:'Vegan',
                subTitle: 'only include Vegan meals',
                filter: vegan,
                onChange: (bool value) {
                  setState(() {
                    vegan = value;
                  });
                }
            ),
            listTile(
                context: context,
                title:'Vegetarian',
                subTitle: 'only include Vegetarian meals',
                filter: vegetarian,
                onChange: (bool value) {
                  setState(() {
                    vegetarian = value;
                  });
                }
            ),
          ],
        ),
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