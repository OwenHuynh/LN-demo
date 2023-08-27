import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/presentation/view_models/base/base_state.dart';
import 'package:lnsp/utils/base/page_state.dart';

part 'lnsp_app_state.freezed.dart';

@freezed
class lnspAppState with _$lnspAppState implements BaseState {
  factory lnspAppState({
    required PageState pageState,
    required bool isLogged,
  }) = _lnspAppState;

  factory lnspAppState.initial() => lnspAppState(
        isLogged: false,
        pageState: PageState.initial,
      );
}
