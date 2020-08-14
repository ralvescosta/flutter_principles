import 'package:architecture_week/app/models/api_advisor_model.dart';
import 'package:architecture_week/app/viewmodels/api_advisor_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeController {
  final ApiAdvisorViewModel apiAdvisorViewModel;

  HomeController(this.apiAdvisorViewModel);

  ValueNotifier<ApiAdvisorModel> get weather =>
      apiAdvisorViewModel.apiAdvisorModel;

  fetchWeather() {
    apiAdvisorViewModel.fill();
  }
}
