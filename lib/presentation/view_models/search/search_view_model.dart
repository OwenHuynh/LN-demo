import 'package:lnsp/presentation/pages/search/mock/mock_search.dart';
import 'package:lnsp/presentation/view_models/base/base_view_model.dart';
import 'package:lnsp/presentation/view_models/search/search_state.dart';

class SearchViewModel extends BaseViewModel<SearchState> {
  SearchViewModel() : super(SearchState());

  @override
  Future<void> onInit() async {
    setListSearch();
  }

  void setListSearch() {
    final listSearch = MockSearch.listSearch;
    setState((state) => state.copyWith(listSearch: listSearch));
  }

  void searchEvent(String keyword) {
    final result = MockSearch.listSearch
        .where((e) => e.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    setState((state) => state.copyWith(listSearch: result));
  }
}
