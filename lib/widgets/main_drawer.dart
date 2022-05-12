import 'package:flutter/material.dart';
import 'package:recipes_app/screens/filters_screen.dart';
import 'package:recipes_app/screens/tabs_screen.dart';
import 'package:recipes_app/widgets/drawer_navigation_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            child: Text(
              'Recipeast',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DrawerNavigationItem(
            title: 'Categories',
            icon: Icons.restaurant,
            routeName: TabsScreen.routeName,
          ),
          DrawerNavigationItem(
            title: 'Filters',
            icon: Icons.settings,
            routeName: FiltersScreen.routeName,
          ),
        ],
      ),
    );
  }
}
