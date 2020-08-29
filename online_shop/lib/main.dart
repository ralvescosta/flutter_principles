import 'package:flutter/material.dart';
import 'package:online_shop/core/styles/theme.dart';
import 'package:online_shop/home/presenter/home_screen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   statusBarBrightness: Brightness.light,
    //   statusBarIconBrightness: Brightness.light,
    // ));
    return MaterialApp(
      title: 'Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: textColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
