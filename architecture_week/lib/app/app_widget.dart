import 'package:architecture_week/app/app_controller.dart';
import 'package:architecture_week/app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: Modular.get<AppController>().themeSwitch,
      builder: (context, isDark, child) {
        return MaterialApp(
          title: 'App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: isDark ? Brightness.dark : Brightness.light,
          ),
          home: HomeScreen(),
        );
      },
    );
  }
}
