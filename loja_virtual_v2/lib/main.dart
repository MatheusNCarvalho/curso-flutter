
import 'package:flutter/material.dart';
import 'package:loja_virtual_v2/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter's Clothing",
      theme: ThemeData(
        primarySwatch:  Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 15, 141)
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
