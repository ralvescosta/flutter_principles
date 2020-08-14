import 'package:architecture_week/app/app_module.dart';
import 'package:architecture_week/app/interfaces/client_http_interface.dart';
import 'package:architecture_week/app/models/api_advisor_model.dart';
import 'package:architecture_week/app/services/client_http_service.dart';
import 'package:architecture_week/app/viewmodels/api_advisor_viewmodel.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:architecture_week/app/repositories/api_advisor_repository.dart';
import 'package:mockito/mockito.dart';

class ClientHttpMockito extends Mock implements IClientHttp {}

main() {
  initModule(AppModule(), changeBinds: [
    Bind<IClientHttp>((i) => (ClientHttpMockito())),
  ])
  final viewModel = Modular.get<ApiAdvisorViewModel>();
  final httpClient = Module.get<ClientHttpMockito>();
  group("ApiAdvisorViewModel", () {
    test('ApiAdvisorViewModel error', () async {
      when(httpClient.get(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f"))
          .thenThrow(Exception("error"));

      await viewModel.fill();
      expect(viewModel.apiAdvisorModel.value, null);
    });

    test('ApiAdvisorViewModel success', () async {
      when(httpClient.get(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f"))
          .thenAnswer((_) => Future.value([
                ApiAdvisorModel(
                        country: "BR", date: "2020/05/30", text: "fdsff")
                    .toJson(),
              ]));
      await viewModel.fill();
      expect(viewModel.apiAdvisorModel.value, isA<ApiAdvisorModel>());
    });
  });
}
