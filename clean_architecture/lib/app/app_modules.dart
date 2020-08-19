import 'package:clean_architecture/app/app_widget.dart';
import 'package:clean_architecture/app/modules/search/presenter/search/search_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/search/application/repositories/search_repository_impl.dart';
import 'modules/search/business/usecases/search_by_text.dart';
import 'modules/search/infrastructure/datasources/github_datasource.dart';

class AppModules extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GitHubDataSource(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => SearchByTextImpl(i())),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [Router('/', child: (_, __) => SearchScreen())];
}
