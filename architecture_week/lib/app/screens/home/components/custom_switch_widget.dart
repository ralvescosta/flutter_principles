import 'package:architecture_week/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomSwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: Modular.get<AppController>().isDark,
      onChanged: (value) {
        Modular.get<AppController>().viewModel.changeTheme(value);
      },
    );
  }
}
