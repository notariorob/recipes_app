import 'package:flutter/material.dart';
import 'package:recipes_app/data/mock_categories.dart';
import 'package:recipes_app/widgets/category_list_item.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Everyday recipes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: [
            ...mockCategories.map(
              (category) => CategoryListItem(category: category),
            )
          ],
        ),
      ),
    );
  }
}
