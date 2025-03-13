import 'package:flutter/material.dart';
class DrawerMain extends StatelessWidget {
  const DrawerMain({
    super.key,
    required this.onSelectScreen});

  final Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.symmetric(horizontal: 36),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.onPrimary,
                  Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
                ])
              ),
                child: Row(
                  children: [
                    Icon(
                        Icons.fastfood,
                      size: 45,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'Cooking Up...!',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    )
                  ],
                )
            ),
            ListTile(
              onTap: (){
                onSelectScreen('Settings');
              },
              leading: Icon(
                  Icons.restaurant,
                  color :Theme.of(context).colorScheme.onBackground,
              ),
              title: Text(
                  'Meals!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  )
              ),
            ),
            ListTile(
              onTap: (){
                onSelectScreen('Filters');
              },
              leading: Icon(
                Icons.settings,
                color :Theme.of(context).colorScheme.onBackground,
              ),
              title: Text(
                  'Filters!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  )
              ),
            )

          ],
        ),
    );
  }
}
