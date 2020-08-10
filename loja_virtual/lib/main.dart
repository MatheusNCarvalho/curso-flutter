import 'package:flutter/material.dart';
import 'package:lojavirtual/models/user_model.dart';
import 'package:lojavirtual/pages/home_page.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: "Flutter's Clothing",
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Color.fromARGB(255, 4, 125, 141)
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      )
    );
  }
}

