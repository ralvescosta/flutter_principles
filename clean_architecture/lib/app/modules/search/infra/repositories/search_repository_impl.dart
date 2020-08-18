import 'package:clean_architecture/app/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture/app/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/app/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architecture/app/modules/search/infra/datasources/search_datasource.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
      String searchText) async {
    try {
      final result = await this.datasource.getSearch(searchText);
      return Right(result);
    } on DataSourceError catch (err) {
      return Left(err);
    } catch (err) {
      return Left(DataSourceError());
    }
  }
}
