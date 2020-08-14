import 'package:flutter/material.dart';

///Singleton
class AppController {
  final themeSwitch = ValueNotifier<bool>(false);

  ///Singleton prevented reeinstance
  AppController._();

  ///static final prevented a overrides
  static final AppController instance = AppController._();

  changeTheme(bool value) {
    themeSwitch.value = value;
  }
}
