import 'package:clean_architecture/app/modules/search/business/errors/errors.dart';
import 'package:clean_architecture/app/modules/search/application/datasources/search_datasource.dart';
import 'package:clean_architecture/app/modules/search/application/models/result_search_model.dart';
import 'package:clean_architecture/app/modules/search/application/repositories/search_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDataSourceSpy extends Mock implements SearchDataSource {}

void main() {
  final datasource = SearchDataSourceSpy();
  final sut = SearchRepositoryImpl(datasource);

  test('Should return a ResultSearch List', () async {
    when(datasource.getSearch(any))
        .thenAnswer((_) async => List<ResultSearchModel>());

    final result = await sut.search("any_value");
    expect(result | null, isA<List<ResultSearchModel>>());
  });

  test('Should return a Exception if DataSource throws', () async {
    when(datasource.getSearch(any)).thenThrow(Exception());

    final result = await sut.search("any_value");
    expect(result.fold(id, id), isA<DataSourceError>());
  });
}
