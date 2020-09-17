import 'package:arch/app/interfaces/local_storage_interface.dart';
import 'package:arch/app/services/shared_local_storage_service.dart';
import 'package:arch/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/foundation.dart';

class AppController {
  final ChangeThemeViewModel changeThemeViewModel;

  AppController(this.changeThemeViewModel) {
    changeThemeViewModel.init();
  }

  // static final AppController instance = AppController._();

  // AppController._() {
  //   changeThemeViewModel.init();
  // }

  bool get isDark => changeThemeViewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewModel.config.themeSwitch;

  final ILocalStorage storage = SharedLocalStorageService();
}
