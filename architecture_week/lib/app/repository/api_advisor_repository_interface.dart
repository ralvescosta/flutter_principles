import 'package:architecture_week/app/models/api_advisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiAdvisorModel> getWeather();
}
