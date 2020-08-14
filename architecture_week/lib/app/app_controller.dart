import 'package:architecture_week/app/interfaces/local_storage_interface.dart';
import 'package:architecture_week/app/models/app_config_model.dart';
import 'package:architecture_week/app/services/shared_local_storage_service.dart';
import 'package:flutter/material.dart';

///Singleton
class AppController {
  final AppConfigModel config = AppConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  final ILocalStorage storage = SharedLocalStorageService();
  /**
   * Singleton
   */
  ///Singleton prevented reeinstance
  AppController._() {
    storage.get("isDark").then((value) {
      if (value != null) {
        config.themeSwitch.value = value;
      }
    });
  }

  ///static final prevented a overrides
  static final AppController instance = AppController._();
  /** */

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.insert("isDark", value);
  }
}
