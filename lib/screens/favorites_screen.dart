import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/favorites';
  static const screenName = 'Favorites';

  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Favorites!'),
    );
  }
}
