
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Container(color: Colors.yellow,),
        Container(color: Colors.red,),
      ],
    );
  }
}

