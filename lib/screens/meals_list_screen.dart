import 'package:flutter/material.dart';
import 'package:recipes_app/models/category.dart';
import 'package:recipes_app/models/meal.dart';
import 'package:recipes_app/widgets/meal_list_item.dart';

class MealsListScreen extends StatelessWidget {
  static const routeName = '/meals';

  const MealsListScreen({Key? key, required this.meals}) : super(key: key);

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final List<Meal> categoryMeals =
        meals.where((meal) => meal.categories.contains(category.id)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) => MealListItem(
            meal: categoryMeals[index],
          ),
        ),
      ),
    );
  }
}
