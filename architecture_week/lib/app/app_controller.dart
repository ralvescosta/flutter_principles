import 'package:architecture_week/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/material.dart';

///Singleton
class AppController {
  final ChangeThemeViewModel viewModel;

  AppController(this.viewModel) {
    viewModel.init();
  }

  bool get isDark => viewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => viewModel.config.themeSwitch;
}
