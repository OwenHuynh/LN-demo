import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/presentation/view_models/search/search_state.dart';
import 'package:lnsp/presentation/view_models/search/search_view_model.dart';

final searchProvider =
    StateNotifierProvider.autoDispose<SearchViewModel, SearchState>(
  (ref) {
    return SearchViewModel();
  },
);
