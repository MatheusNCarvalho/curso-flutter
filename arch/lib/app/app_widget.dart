import 'package:arch/app/app_controller.dart';
import 'package:arch/app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: Modular.get<AppController>().themeSwitch,
      builder: (context, isDart, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: isDart ? Brightness.dark : Brightness.light
          ),
          initialRoute: '/',
          onGenerateRoute: Modular.generateRoute,
          navigatorKey: Modular.navigatorKey,
          //home: HomePage(),
        );
      },
    );
  }
}
