import 'package:flutter/cupertino.dart';

enum Filter { vegetarian, vegan, lactoseFree, glutenFree }

class Preferences with ChangeNotifier {
  final Map<Filter, bool> _filters = {
    Filter.vegetarian: false,
    Filter.vegan: false,
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
  };

  final List<String> _favoriteMealIds = [];

  Map<Filter, bool> get filters => _filters;

  bool isMealInFavorites(String id) => _favoriteMealIds.contains(id);

  void toggleFavorite(String id) {
    var index =
        _favoriteMealIds.indexWhere((favoriteMealId) => favoriteMealId == id);
    if (index >= 0) {
      _favoriteMealIds.removeAt(index);
    } else {
      _favoriteMealIds.add(id);
    }
    notifyListeners();
  }

  void updateFilter(Filter filter, value) {
    _filters[filter] = value;
    notifyListeners();
  }

  bool shouldDisplayMeal(meal) =>
      (_filters[Filter.glutenFree]! ? meal.isGlutenFree : true) &&
      (_filters[Filter.vegan]! ? meal.isVegan : true) &&
      (_filters[Filter.vegetarian]! ? meal.isVegetarian : true) &&
      (_filters[Filter.lactoseFree]! ? meal.isLactoseFree : true);
}
