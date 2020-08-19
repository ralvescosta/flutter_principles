import 'package:clean_architecture/app/app_modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(
    module: AppModules(),
  ));
}
