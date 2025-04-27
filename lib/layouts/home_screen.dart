import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/widgets/category_item.dart';

import '../models/meal.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.availableMeal});
  final List<Meal> availableMeal;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with SingleTickerProviderStateMixin{
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 1,
    )..forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        child:  GridView.builder(
          itemBuilder: (BuildContext context, int index) => CategoryItem(
            category: availableCategories[index],
            availableMeal: widget.availableMeal,
          ),
          itemCount: availableCategories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 3/2
          ),
        ),
        builder:(context,child)=>Padding(
            padding: EdgeInsets.only(top: 140- _controller.value*140),
          child: child,
        ) );
  }
}
