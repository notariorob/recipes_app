import 'package:flutter/material.dart';
import 'package:recipes_app/models/meal.dart';
import 'package:recipes_app/screens/category_list_screen.dart';
import 'package:recipes_app/screens/favorites_screen.dart';
import 'package:recipes_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'title': CategoryListScreen.screenName,
        'widget': const CategoryListScreen()
      },
      {'title': FavoritesScreen.screenName, 'widget': const FavoritesScreen()},
    ];

    super.initState();
  }

  _handleTabTap(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedTabIndex]['title'] as String,
        ),
      ),
      body: _pages[_selectedTabIndex]['widget'] as Widget,
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        onTap: _handleTabTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
