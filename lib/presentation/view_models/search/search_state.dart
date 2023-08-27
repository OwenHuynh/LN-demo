import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/presentation/pages/search/mock/mock_search.dart';
import 'package:lnsp/presentation/view_models/base/base_state.dart';
import 'package:lnsp/utils/base/page_state.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState implements BaseState {
  factory SearchState({
    @Default(PageState.initial) PageState pageState,
    @Default([]) List<SearchModel> listSearch,
  }) = _SearchState;
}
