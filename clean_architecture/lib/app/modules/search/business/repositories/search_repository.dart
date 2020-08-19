import 'package:clean_architecture/app/modules/search/business/entities/result_search.dart';
import 'package:clean_architecture/app/modules/search/business/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText);
}
