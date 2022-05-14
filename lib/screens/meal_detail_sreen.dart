import 'package:flutter/material.dart';
import 'package:recipes_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal/detail';
  const MealDetailScreen(
      {Key? key,
      required this.onFavoriteToggled,
      required this.favoriteChecker})
      : super(key: key);

  final Function(Meal) onFavoriteToggled;
  final Function(String) favoriteChecker;

  Widget _buildSectionTitle(BuildContext context, String title) => Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      );

  @override
  Widget build(BuildContext context) {
    Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () => onFavoriteToggled(meal),
        child: Icon(
          favoriteChecker(meal.id)
              ? Icons.favorite
              : Icons.favorite_border_outlined,
          color: Colors.red,
        ),
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle(context, 'Ingredients'),
                    const SizedBox(
                      height: 8,
                    ),
                    ...meal.ingredients.map(
                      (ingredient) => Row(
                        children: [
                          const Text('\u2022 '),
                          Text(ingredient),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    _buildSectionTitle(context, 'Instructions'),
                    const SizedBox(
                      height: 8,
                    ),
                    ...meal.steps.map(
                      (step) => Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          children: [
                            const Text('\u2022 '),
                            Flexible(
                              child: Text(
                                step,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
