import 'package:flutter/material.dart';
import 'package:flutter_go_fast/app/core/interfaces/app_theme_interface.dart';
import 'package:flutter_go_fast/app/core/interfaces/shared_repository_interface.dart';
import 'package:flutter_go_fast/app/core/theme/app_theme_dark.dart';
import 'package:flutter_go_fast/app/core/theme/app_theme_light.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  ISharedRepository sharedRepository = Modular.get();

  _AppControllerBase() {
    getThemeData();
  }

  @observable
  IAppTheme appTheme = AppThemeLight();

  @action
  getThemeData() async {
    await sharedRepository.getValue<String>('theme_mode').then(
      (value) {
        var themeMode =
            value == 'ThemeMode.dark' ? ThemeMode.dark : ThemeMode.light;
        setThemeData(themeMode, saveShared: false);
      },
    );
  }

  @action
  setThemeData(ThemeMode themeMode, {bool saveShared = true}) async {
    switch (themeMode) {
      case ThemeMode.dark:
        appTheme = AppThemeDark();
        break;
      default:
        appTheme = AppThemeLight();
        break;
    }

    if (saveShared) {
      await sharedRepository.setValue("theme_mode", themeMode.toString());
    }
  }
}
