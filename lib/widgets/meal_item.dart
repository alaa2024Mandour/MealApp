import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/layouts/meal_detail_screen.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MealDetailScreen(
                meal: meal,
                onToggleFavorites: (Meal meal) {  },
                )
              ),
          );
        },
        child: Column(
          children: [
            Stack(
              children: [
                FadeInImage(
                    placeholder: MemoryImage(kTransparentImage), 
                    image: NetworkImage(meal.imageUrl)
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 44
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      child: Column(
                        children: [
                              Text(
                                  meal.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                        ],
                      ),
                    )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.schedule),
                    Text('${meal.duration} min' , style: TextStyle(color: Colors.white,))
                  ],
                ),

                Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.work),
                    Text(meal.complexityText , style: TextStyle(color: Colors.white,))
                  ],
                ),

                Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.attach_money),
                    Text(meal.affordabilityText , style: TextStyle(color: Colors.white,))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
