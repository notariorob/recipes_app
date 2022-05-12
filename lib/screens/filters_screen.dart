import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';
  static const screenName = 'Filters';

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences'),
      ),
      drawer: const MainDrawer(),
      body: Text('Filters!'),
    );
  }
}
