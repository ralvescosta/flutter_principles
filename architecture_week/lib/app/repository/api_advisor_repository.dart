import 'package:architecture_week/app/interfaces/client_http_interface.dart';
import 'package:architecture_week/app/models/api_advisor_model.dart';
import 'package:architecture_week/app/repository/api_advisor_repository_interface.dart';

class ApiAdvisorRepository implements IApiAdvisor {
  final IClientHttp clientHttp;

  ApiAdvisorRepository(this.clientHttp);

  @override
  Future<ApiAdvisorModel> getWeather() async {
    var json = await this.clientHttp.get(
        "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f");

    ApiAdvisorModel model = ApiAdvisorModel.fromJson(json[0]);
    return model;
  }
}
