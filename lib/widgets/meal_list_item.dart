import 'package:flutter/material.dart';
import 'package:recipes_app/models/affordability.dart';
import 'package:recipes_app/models/difficulty.dart';
import 'package:recipes_app/models/meal.dart';
import 'package:recipes_app/screens/meal_detail_sreen.dart';

class MealListItem extends StatelessWidget {
  final Meal meal;
  const MealListItem({Key? key, required this.meal}) : super(key: key);

  void _handleCategoryTap(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: meal,
    );
  }

  String get difficultyText {
    switch (meal.difficulty) {
      case Difficulty.Easy:
        return 'Easy';
      case Difficulty.Medium:
        return 'Medium';
      case Difficulty.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricy:
        return 'Pricy';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.only(
          bottom: 8,
        ),
        child: InkWell(
          onTap: () => _handleCategoryTap(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Hero(
                        tag: meal.id,
                        child: Image.network(
                          meal.imageUrl,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 0,
                      child: Container(
                        width: constraints.maxWidth - 16,
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 8,
                        ),
                        child: Text(
                          meal.title,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                blurRadius: 2,
                                offset: Offset(
                                  2,
                                  2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.schedule,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${meal.duration} min',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.work,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            difficultyText,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.attach_money,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            affordabilityText,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
