import 'package:architecture_week/app/models/app_config_model.dart';
import 'package:architecture_week/app/services/shared_local_storage_service.dart';
import 'package:architecture_week/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/material.dart';

///Singleton
class AppController {
  final ChangeThemeViewModel viewModel =
      ChangeThemeViewModel(storage: SharedLocalStorageService());

  bool get isDark => viewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => viewModel.config.themeSwitch;
  /**
   * Singleton
   */
  ///Singleton prevented reeinstance
  AppController._() {
    viewModel.init();
  }

  ///static final prevented a overrides
  static final AppController instance = AppController._();
  /** */
}
