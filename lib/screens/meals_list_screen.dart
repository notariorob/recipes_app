import 'package:flutter/material.dart';
import 'package:recipes_app/data/mock_meals.dart';
import 'package:recipes_app/models/category.dart';
import 'package:recipes_app/models/meal.dart';

class MealsListScreen extends StatelessWidget {
  static const routeName = '/meals';

  const MealsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final List<Meal> categoryMeals = MOCK_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) => Text(
            categoryMeals[index].title,
          ),
        ),
      ),
    );
  }
}
