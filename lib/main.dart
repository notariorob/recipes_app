import 'package:flutter/material.dart';
import 'package:recipes_app/data/mock_meals.dart';
import 'package:recipes_app/models/filters.dart';
import 'package:recipes_app/models/meal.dart';
import 'package:recipes_app/screens/category_list_screen.dart';
import 'package:recipes_app/screens/filters_screen.dart';
import 'package:recipes_app/screens/meal_detail_sreen.dart';
import 'package:recipes_app/screens/meals_list_screen.dart';
import 'package:recipes_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _filteredMeals = MOCK_MEALS;
  Map<Filter, bool> _filters = {
    Filter.vegetarian: false,
    Filter.vegan: false,
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
  };

  void _updateFilter(Map<Filter, bool> filter) {
    setState(() {
      _filters = {..._filters, ...filter};
      _filteredMeals = _filteredMeals
          .where((meal) =>
              (_filters[Filter.glutenFree]! ? meal.isGlutenFree : true) &&
              (_filters[Filter.vegan]! ? meal.isVegan : true) &&
              (_filters[Filter.vegetarian]! ? meal.isVegetarian : true) &&
              (_filters[Filter.lactoseFree]! ? meal.isLactoseFree : true))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Everyday recipes',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
        canvasColor: Color.fromARGB(255, 252, 233, 255),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromARGB(
                  255,
                  20,
                  51,
                  51,
                ),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromARGB(
                  255,
                  20,
                  51,
                  51,
                ),
              ),
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (context) => const TabsScreen(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(filters: _filters, onFilterToggled: _updateFilter),
        CategoryListScreen.routeName: (context) => const CategoryListScreen(),
        MealsListScreen.routeName: (context) =>
            MealsListScreen(meals: _filteredMeals),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
      },
    );
  }
}
