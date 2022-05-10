import 'package:flutter/material.dart';
import 'package:recipes_app/models/category.dart';
import 'package:recipes_app/screens/meals_list_screen.dart';

class CategoryListItem extends StatelessWidget {
  final Category category;
  const CategoryListItem({Key? key, required this.category}) : super(key: key);

  void _handleCategoryTap(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealsListScreen.routeName,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _handleCategoryTap(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.4),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
