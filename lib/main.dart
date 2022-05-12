import 'package:flutter/material.dart';
import 'package:recipes_app/screens/category_list_screen.dart';
import 'package:recipes_app/screens/filters_screen.dart';
import 'package:recipes_app/screens/meal_detail_sreen.dart';
import 'package:recipes_app/screens/meals_list_screen.dart';
import 'package:recipes_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Everyday recipes',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
        canvasColor: Color.fromARGB(255, 255, 240, 240),
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
        FiltersScreen.routeName: (context) => const FiltersScreen(),
        CategoryListScreen.routeName: (context) => const CategoryListScreen(),
        MealsListScreen.routeName: (context) => const MealsListScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
      },
    );
  }
}
