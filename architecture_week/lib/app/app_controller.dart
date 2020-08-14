import 'package:architecture_week/app/models/app_config_model.dart';
import 'package:flutter/material.dart';

///Singleton
class AppController {
  ///Singleton prevented reeinstance
  AppController._();

  ///static final prevented a overrides
  static final AppController instance = AppController._();

  final AppConfigModel config = AppConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  changeTheme(bool value) {
    config.themeSwitch.value = value;
  }
}
