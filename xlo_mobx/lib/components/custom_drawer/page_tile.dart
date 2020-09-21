import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  const PageTile(
      {Key key, this.label, this.iconData, this.onTap, this.highligted})
      : super(key: key);

  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highligted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          color: highligted ? Colors.purple : Colors.black54,
          fontWeight: FontWeight.w700
        ),
      ),
      leading: Icon(
        iconData,
        color: highligted ? Colors.purple : Colors.black54,
      ),
      onTap: onTap,
    );
  }
}
