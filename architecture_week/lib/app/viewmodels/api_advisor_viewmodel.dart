import 'package:architecture_week/app/models/api_advisor_model.dart';
import 'package:architecture_week/app/repository/api_advisor_repository_interface.dart';
import 'package:flutter/material.dart';

class ApiAdvisorViewModel {
  final apiAdvisorModel = ValueNotifier<ApiAdvisorModel>(null);

  final IApiAdvisor repository;

  ApiAdvisorViewModel(this.repository);

  fill() async {
    apiAdvisorModel.value = await repository.getWeather();
  }
}
