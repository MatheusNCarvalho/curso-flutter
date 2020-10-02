// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$appThemeAtom = Atom(name: '_AppControllerBase.appTheme');

  @override
  IAppTheme get appTheme {
    _$appThemeAtom.reportRead();
    return super.appTheme;
  }

  @override
  set appTheme(IAppTheme value) {
    _$appThemeAtom.reportWrite(value, super.appTheme, () {
      super.appTheme = value;
    });
  }

  final _$getThemeDataAsyncAction =
      AsyncAction('_AppControllerBase.getThemeData');

  @override
  Future getThemeData() {
    return _$getThemeDataAsyncAction.run(() => super.getThemeData());
  }

  final _$setThemeDataAsyncAction =
      AsyncAction('_AppControllerBase.setThemeData');

  @override
  Future setThemeData(ThemeMode themeMode, {bool saveShared = true}) {
    return _$setThemeDataAsyncAction
        .run(() => super.setThemeData(themeMode, saveShared: saveShared));
  }

  @override
  String toString() {
    return '''
appTheme: ${appTheme}
    ''';
  }
}
