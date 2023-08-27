import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/presentation/view_models/home/home_state.dart';
import 'package:lnsp/presentation/view_models/home/home_view_model.dart';

final homeProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeState>((ref) {
  return HomeViewModel();
});
