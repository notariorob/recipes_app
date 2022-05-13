import 'package:flutter/material.dart';

class FilterToggle extends StatelessWidget {
  const FilterToggle(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.value,
      required this.onChanged})
      : super(key: key);

  final String title;
  final String subtitle;
  final bool value;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }
}
