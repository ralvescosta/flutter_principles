import 'package:clean_architecture/app/modules/search/business/entities/result_search.dart';
import 'package:clean_architecture/app/modules/search/business/errors/errors.dart';

abstract class SearchState {}

class SearchStart implements SearchState {}

class SearchSuccess implements SearchState {
  final List<ResultSearch> list;

  SearchSuccess(this.list);
}

class SearchLoading implements SearchState {}

class SearchError implements SearchState {
  final FailureSearch error;

  SearchError({this.error});
}
