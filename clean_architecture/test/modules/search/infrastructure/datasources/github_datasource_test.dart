import 'dart:convert';

import 'package:clean_architecture/app/modules/search/business/errors/errors.dart';
import 'package:clean_architecture/app/modules/search/infrastructure/datasources/github_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_github_response.dart';

class DioSpy extends Mock implements Dio {}

void main() {
  final dioSpy = DioSpy();
  final sut = GitHubDataSource(dioSpy);
  test('Should returns ResultSearchModel on Http success', () async {
    when(dioSpy.get(any)).thenAnswer(
        (_) async => Response(data: jsonDecode(githubResult), statusCode: 200));

    final future = sut.getSearch("any_text");
    expect(future, completes);
  });

  test('Should returns DataSourceError on Http Error', () async {
    when(dioSpy.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 400));

    final future = sut.getSearch("any_text");
    expect(future, throwsA(isA<DataSourceError>()));
  });

  test('Should returns DataSourceError on Dio Throws', () async {
    when(dioSpy.get(any)).thenThrow(Exception());

    final future = sut.getSearch("any_text");
    expect(future, throwsA(isA<Exception>()));
  });
}
