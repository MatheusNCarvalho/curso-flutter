import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: onPressed,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 20),
          )
        : RaisedButton(
            onPressed: onPressed,
            child: Text(label),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button.color,
          );
  }
}
