import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/presentation/pages/notification/mock/notification_model.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/view_models/base/base_state.dart';
import 'package:lnsp/utils/base/page_state.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState implements BaseState {
  factory NotificationState({
    @Default(PageState.initial) PageState pageState,
    @Default(false) bool isLogin,
    @Default(TabIndex.first) TabIndex tabIndex,
    @Default(0) int tabBarSelected,
    @Default([]) List<MockNotificationModel> listNotice,
    @Default("") titleProductList,
  }) = _NotificationState;
}

enum TabIndex { first, second, third }

extension TabIndexExt on TabIndex {
  int get index {
    switch (this) {
      case TabIndex.first:
        return 0;
      case TabIndex.second:
        return 1;
      case TabIndex.third:
        return 2;
    }
  }

  String get title {
    switch (this) {
      case TabIndex.first:
        return "First";
      case TabIndex.second:
        return "Second";
      case TabIndex.third:
        return "Thirst";
    }
  }

  Color get color {
    return AppColors.activeColor;
  }
}
