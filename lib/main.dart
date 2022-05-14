import 'package:flutter/material.dart';
import 'package:recipes_app/data/mock_meals.dart';
import 'package:recipes_app/models/meal.dart';
import 'package:recipes_app/models/preferences.dart';
import 'package:recipes_app/screens/category_list_screen.dart';
import 'package:recipes_app/screens/filters_screen.dart';
import 'package:recipes_app/screens/meal_detail_sreen.dart';
import 'package:recipes_app/screens/meals_list_screen.dart';
import 'package:recipes_app/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Preferences(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        FiltersScreen.routeName: (_) => const FiltersScreen(),
        MealsListScreen.routeName: (_) => const MealsListScreen(),
        MealDetailScreen.routeName: (_) => const MealDetailScreen(),
      },
    );
  }
}
