import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/mock_meals.dart';
import '../models/meal.dart';
import '../models/preferences.dart';
import 'meal_list_item.dart';

class MealList extends StatelessWidget {
  const MealList({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    var preferences = context.watch<Preferences>();
    final List<Meal> categoryMeals = MOCK_MEALS
        .where((meal) =>
            meal.categories.contains(categoryId) &&
            preferences.shouldDisplayMeal(meal))
        .toList();

    return ListView.builder(
      itemCount: categoryMeals.length,
      itemBuilder: (context, index) => MealListItem(
        meal: categoryMeals[index],
      ),
    );
  }
}
