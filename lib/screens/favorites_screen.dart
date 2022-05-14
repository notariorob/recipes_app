import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/data/mock_meals.dart';
import 'package:recipes_app/models/preferences.dart';
import 'package:recipes_app/widgets/meal_list_item.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/favorites';
  static const screenName = 'Favorites';

  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var preferences = context.watch<Preferences>();
    var favorites = MOCK_MEALS
        .where((meal) => preferences.isMealInFavorites(meal.id))
        .toList();
    return favorites.isEmpty
        ? const Center(
            child: Text(
              'You haven\'t added any meals to your favorites yet',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          )
        : ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) => MealListItem(
              meal: favorites[index],
            ),
          );
  }
}
