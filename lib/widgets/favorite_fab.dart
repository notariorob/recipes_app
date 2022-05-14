import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/preferences.dart';

class FavoriteFAB extends StatelessWidget {
  const FavoriteFAB({
    Key? key,
    required this.mealId,
  }) : super(key: key);

  final String mealId;

  @override
  Widget build(BuildContext context) {
    var preferences = context.watch<Preferences>();
    return FloatingActionButton(
      backgroundColor: Theme.of(context).accentColor,
      onPressed: () => preferences.toggleFavorite(mealId),
      child: Icon(
        preferences.isMealInFavorites(mealId)
            ? Icons.favorite
            : Icons.favorite_border_outlined,
        color: Colors.red,
      ),
    );
  }
}
