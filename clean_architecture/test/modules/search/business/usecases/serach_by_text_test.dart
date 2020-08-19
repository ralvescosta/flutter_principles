import 'package:clean_architecture/app/modules/search/business/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture/app/modules/search/business/repositories/search_repository.dart';
import 'package:clean_architecture/app/modules/search/business/entities/result_search.dart';
import 'package:clean_architecture/app/modules/search/business/usecases/search_by_text.dart';
import 'package:mockito/mockito.dart';

class SearchRepositorySpy extends Mock implements SearchRepository {}

void main() {
  final repository = SearchRepositorySpy();
  final sut = SearchByTextImpl(repository);

  test('Should returns ResultSearch List', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(List<ResultSearch>()));

    final result = await sut('some_text');

    expect(result | null, isA<List<ResultSearch>>());
  });

  test('Should returns Exception if input is wrong', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(List<ResultSearch>()));

    var result = await sut(null);
    expect(result.fold(id, id), isA<InvalidTextError>());

    result = await sut("");
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
