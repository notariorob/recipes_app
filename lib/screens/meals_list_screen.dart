import 'package:flutter/material.dart';
import 'package:recipes_app/models/category.dart';
import 'package:recipes_app/widgets/meal_list.dart';

class MealsListScreen extends StatelessWidget {
  static const routeName = '/meals';

  const MealsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: MealList(categoryId: category.id),
      ),
    );
  }
}
