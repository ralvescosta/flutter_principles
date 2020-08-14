import 'package:architecture_week/app/screens/home/components/custom_switch_widget.dart';
import 'package:architecture_week/app/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cloud),
        onPressed: () {
          controller.fetchWeather();
        },
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          CustomSwitchWidget(),
          ValueListenableBuilder(
              valueListenable: controller.weather,
              builder: (context, model, child) {
                if (model?.text == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Text(model.text);
              })
        ],
      )),
    );
  }
}
