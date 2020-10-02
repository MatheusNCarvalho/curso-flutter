import 'package:flutter/material.dart';
import 'package:flutter_go_fast/app/app_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          title: 'Flutter GoFast',
          theme: Modular.get<AppController>().appTheme.getTheme(),
          // theme: ThemeData(
          //   primarySwatch: Colors.orange,
          //   visualDensity: VisualDensity.adaptivePlatformDensity,
          // ),
          initialRoute: Modular.initialRoute,
          navigatorKey: Modular.navigatorKey,
          onGenerateRoute: Modular.generateRoute,
        );
      },
    );
  }
}
