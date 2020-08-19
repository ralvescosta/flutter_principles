import 'package:clean_architecture/app/modules/search/application/datasources/search_datasource.dart';
import 'package:clean_architecture/app/modules/search/application/models/result_search_model.dart';
import 'package:clean_architecture/app/modules/search/business/errors/errors.dart';
import 'package:dio/dio.dart';

class GitHubDataSource implements SearchDataSource {
  final Dio dio;

  GitHubDataSource(this.dio);

  String _slugify(String searchText) {
    return searchText.replaceAll(" ", "+");
  }

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await this
        .dio
        .get("https://api.github.com/search/users?q=${_slugify(searchText)}");

    if (response.statusCode == 200) {
      final list = (response.data["items"] as List)
          .map((e) => ResultSearchModel.fromMap(e))
          .toList();
      return list;
    } else {
      throw DataSourceError();
    }
  }
}
