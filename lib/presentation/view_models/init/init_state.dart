import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/product_component/product_item_card.dart';
import 'package:lnsp/presentation/view_models/base/base_state.dart';
import 'package:lnsp/utils/base/page_state.dart';

part 'init_state.freezed.dart';

@freezed
class InitState with _$InitState implements BaseState {
  factory InitState({
    @Default(PageState.initial) PageState pageState,
    @Default(false) bool isLogin,
    @Default(TabIndex.home) TabIndex tabIndex,
    @Default(0) int tabBarSelected,
    @Default([]) List<Product> listProduct,
    @Default("") titleProductList,
  }) = _InitState;
}

enum TabIndex { home, shopping, coffee, profile, cart }

extension TabIndexExt on TabIndex {
  int get index {
    switch (this) {
      case TabIndex.home:
        return 0;
      case TabIndex.shopping:
        return 1;
      case TabIndex.coffee:
        return 2;
      case TabIndex.profile:
        return 3;
      case TabIndex.cart:
        return 4;
    }
  }

  String get title {
    switch (this) {
      case TabIndex.home:
        return LocaleKeys.homeTitle.tr();
      case TabIndex.shopping:
        return LocaleKeys.searchText.tr();
      case TabIndex.coffee:
        return LocaleKeys.handshakeText.tr();
      case TabIndex.profile:
        return LocaleKeys.notificationText.tr();
      case TabIndex.cart:
        return LocaleKeys.myPageText.tr();
    }
  }
}
