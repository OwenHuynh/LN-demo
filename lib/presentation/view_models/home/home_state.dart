import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/presentation/view_models/base/base_state.dart';
import 'package:lnsp/utils/base/page_state.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState implements BaseState {
  factory HomeState(
      {@Default(PageState.initial) PageState pageState,
      @Default(TabHomeIndex.TREND) TabHomeIndex tabHomeIndex,
      @Default(0) int tabBarSelected}) = _HomeState;
}

enum TabHomeIndex { TREND, NEW, FEATURE, FAVORITE }

extension TabIndexExt on TabHomeIndex {
  int get index {
    switch (this) {
      case TabHomeIndex.TREND:
        return 0;
      case TabHomeIndex.NEW:
        return 1;
      case TabHomeIndex.FEATURE:
        return 2;
      case TabHomeIndex.FAVORITE:
        return 3;
    }
  }
}
