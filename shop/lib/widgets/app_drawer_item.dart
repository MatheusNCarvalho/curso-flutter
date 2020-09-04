import 'package:flutter/material.dart';

class AppDrawerItem extends StatelessWidget {
  final String routeName;
  final String title;
  final IconData icon;

  AppDrawerItem({
    this.routeName,
    this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(routeName);
      },
    );
  }
}
