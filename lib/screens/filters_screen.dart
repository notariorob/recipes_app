import 'package:flutter/material.dart';
import 'package:recipes_app/models/filters.dart';
import 'package:recipes_app/widgets/filter_toggle.dart';
import 'package:recipes_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';
  static const screenName = 'Filters';

  const FiltersScreen(
      {Key? key, required this.filters, required this.onFilterToggled})
      : super(key: key);
  final Map<Filter, bool> filters;
  final Function(Map<Filter, bool>) onFilterToggled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences'),
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilterToggle(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals',
              value: filters[Filter.vegetarian]!,
              onChanged: (bool checked) =>
                  onFilterToggled({Filter.vegetarian: checked}),
            ),
            FilterToggle(
              title: 'Vegan',
              subtitle: 'Only include vegan meals',
              value: filters[Filter.vegan]!,
              onChanged: (bool checked) =>
                  onFilterToggled({Filter.vegan: checked}),
            ),
            FilterToggle(
              title: 'Gluten free',
              subtitle: 'Only include gluten free meals',
              value: filters[Filter.glutenFree]!,
              onChanged: (bool checked) =>
                  onFilterToggled({Filter.glutenFree: checked}),
            ),
            FilterToggle(
              title: 'Lactose free',
              subtitle: 'Only include lactose free meals',
              value: filters[Filter.lactoseFree]!,
              onChanged: (bool checked) =>
                  onFilterToggled({Filter.lactoseFree: checked}),
            ),
          ],
        ),
      ),
    );
  }
}
