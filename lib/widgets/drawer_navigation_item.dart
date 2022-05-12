import 'package:flutter/material.dart';

class DrawerNavigationItem extends StatelessWidget {
  DrawerNavigationItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.routeName,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final String routeName;

  void _handleItemTap(context) {
    // If currently in the selected route, just close drawer
    if (ModalRoute.of(context)!.settings.name == routeName) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushReplacementNamed(routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: () => _handleItemTap(context),
    );
  }
}
