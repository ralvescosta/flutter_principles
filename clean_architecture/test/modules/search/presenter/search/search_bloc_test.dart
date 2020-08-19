import 'package:clean_architecture/app/modules/search/business/entities/result_search.dart';
import 'package:clean_architecture/app/modules/search/business/errors/errors.dart';
import 'package:clean_architecture/app/modules/search/business/usecases/search_by_text.dart';
import 'package:clean_architecture/app/modules/search/presenter/search/search_bloc.dart';
import 'package:clean_architecture/app/modules/search/presenter/search/state/state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchByTextSpy extends Mock implements SearchByText {}

void main() {
  final usecaseSpy = SearchByTextSpy();
  final sut = SearchBloc(usecaseSpy);

  test('Should returns states on correctly order', () async {
    when(usecaseSpy.call(any)).thenAnswer(
      (_) async => Right(
        List<ResultSearch>(),
      ),
    );

    expect(
      sut,
      emitsInOrder([
        isA<SearchLoading>(),
        isA<SearchSuccess>(),
      ]),
    );
    sut.add("any_text");
  });

  test('Should returns Exception', () async {
    when(usecaseSpy.call(any)).thenAnswer(
      (_) async => Left(
        InvalidTextError(),
      ),
    );

    expect(
      sut,
      emitsInOrder([
        isA<SearchLoading>(),
        isA<SearchError>(),
      ]),
    );
    sut.add("any_text");
  });
}
