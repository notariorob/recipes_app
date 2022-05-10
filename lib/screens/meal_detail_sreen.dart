import 'package:flutter/material.dart';
import 'package:recipes_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal/detail';
  const MealDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          meal.steps.toString(),
        ),
      ),
    );
  }
}
