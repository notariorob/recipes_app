import 'package:flutter/material.dart';
import 'package:recipes_app/models/category.dart';

class CategoryListItem extends StatelessWidget {
  final Category category;
  const CategoryListItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      ),
    );
  }
}
