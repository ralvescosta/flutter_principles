import 'dart:convert';

import 'package:clean_architecture/app/app_modules.dart';
import 'package:clean_architecture/app/modules/search/business/entities/result_search.dart';
import 'package:clean_architecture/app/modules/search/business/usecases/search_by_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'search/infrastructure/datasources/mock_github_response.dart';

class DioSpy extends Mock implements Dio {}

void main() {
  final dioSpy = DioSpy();

  initModule(AppModules(), changeBinds: [
    Bind<Dio>((i) => dioSpy),
  ]);

  test('Should get usecases withou error', () async {
    final usecase = Modular.get<SearchByText>();

    expect(usecase, isA<SearchByText>());
  });

  test('Should return a ResultSearch List', () async {
    when(dioSpy.get(any)).thenAnswer(
      (_) async => Response(data: jsonDecode(githubResult), statusCode: 200),
    );

    final usecase = Modular.get<SearchByText>();
    final result = await usecase("any_text");

    expect(result | null, isA<List<ResultSearch>>());
  });
}
