import 'package:flutter/material.dart';
import 'package:recipes_app/models/category.dart';

class MealsListScreen extends StatelessWidget {
  static const routeName = '/meals';

  const MealsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text((routeArgs['category'] as Category).title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Back',
          ),
        ),
      ),
    );
  }
}
