import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/preferences.dart';
import 'package:recipes_app/widgets/filter_toggle.dart';
import 'package:recipes_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';
  static const screenName = 'Filters';

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var preferences = context.watch<Preferences>();
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
              value: preferences.filters[Filter.vegetarian]!,
              onChanged: (bool checked) =>
                  preferences.updateFilter(Filter.vegetarian, checked),
            ),
            FilterToggle(
              title: 'Vegan',
              subtitle: 'Only include vegan meals',
              value: preferences.filters[Filter.vegan]!,
              onChanged: (bool checked) =>
                  preferences.updateFilter(Filter.vegan, checked),
            ),
            FilterToggle(
              title: 'Gluten free',
              subtitle: 'Only include gluten free meals',
              value: preferences.filters[Filter.glutenFree]!,
              onChanged: (bool checked) =>
                  preferences.updateFilter(Filter.glutenFree, checked),
            ),
            FilterToggle(
              title: 'Lactose free',
              subtitle: 'Only include lactose free meals',
              value: preferences.filters[Filter.lactoseFree]!,
              onChanged: (bool checked) =>
                  preferences.updateFilter(Filter.lactoseFree, checked),
            ),
          ],
        ),
      ),
    );
  }
}
