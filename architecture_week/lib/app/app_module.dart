import 'package:architecture_week/app/app_controller.dart';
import 'package:architecture_week/app/app_widget.dart';
import 'package:architecture_week/app/interfaces/client_http_interface.dart';
import 'package:architecture_week/app/repository/api_advisor_repository.dart';
import 'package:architecture_week/app/repository/api_advisor_repository_interface.dart';
import 'package:architecture_week/app/screens/home/home_controller.dart';
import 'package:architecture_week/app/services/client_http_services.dart';
import 'package:architecture_week/app/services/shared_local_storage_service.dart';
import 'package:architecture_week/app/viewmodels/api_advisor_viewmodel.dart';
import 'package:architecture_week/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/local_storage_interface.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => ApiAdvisorViewModel(i.get())),
        Bind<IApiAdvisor>((i) => (ApiAdvisorRepository(i.get()))),
        Bind<IClientHttp>((i) => (ClientHttpService())),
        Bind((i) => (AppController(i.get())), lazy: false),
        Bind((i) => (ChangeThemeViewModel(storage: i.get()))),
        Bind<ILocalStorage>((i) => (SharedLocalStorageService())),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => null;
}
