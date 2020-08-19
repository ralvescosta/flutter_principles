import 'package:bloc/bloc.dart';
import 'package:clean_architecture/app/modules/search/business/usecases/search_by_text.dart';
import 'package:clean_architecture/app/modules/search/presenter/search/state/state.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<String, SearchState> {
  final SearchByText usecase;
  SearchBloc(this.usecase) : super(SearchStart());

  @override
  Stream<SearchState> mapEventToState(String searchText) async* {
    yield SearchLoading();
    final result = await usecase(searchText);
    print(result);
    yield result.fold((l) => SearchError(error: l), (r) => SearchSuccess(r));
  }

  @override
  Stream<Transition<String, SearchState>> transformEvents(
      Stream<String> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(microseconds: 800)), transitionFn);
  }
}
