import 'package:bloc/bloc.dart';
import 'package:clean_architecture/app/modules/search/business/usecases/search_by_text.dart';
import 'package:clean_architecture/app/modules/search/presenter/search/state/state.dart';

class SearchBloc extends Bloc<String, SearchState> {
  final SearchByText usecase;
  SearchBloc(this.usecase) : super(SearchStart());

  @override
  Stream<SearchState> mapEventToState(String searchText) async* {
    yield SearchLoading();
    final result = await this.usecase(searchText);
    yield result.fold((l) => SearchError(error: l), (r) => SearchSuccess(r));
  }
}
