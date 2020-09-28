import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_go_fast/app/app_widget.dart';
import 'package:flutter_go_fast/app/modules/app_controller.dart';
import 'package:flutter_go_fast/app/modules/home/home_module.dart';
import 'package:flutter_go_fast/app/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          "/",
          child: (_, args) => SplashPage(),
          transition: TransitionType.noTransition,
        ),
        ModularRouter("/home", module: HomeModule()),
      ];
}
