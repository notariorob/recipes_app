import 'package:flutter/material.dart';
import 'package:recipes_app/data/mock_categories.dart';
import 'package:recipes_app/widgets/category_list_item.dart';

class CategoryListScreen extends StatelessWidget {
  static const routeName = '/categories';
  static const screenName = 'Categories';
  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          ...MOCK_CATEGORIES.map(
            (category) => CategoryListItem(category: category),
          )
        ],
      ),
    );
  }
}
