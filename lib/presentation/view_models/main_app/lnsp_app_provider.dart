import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/presentation/navigation/navigation_provider.dart';
import 'package:lnsp/presentation/view_models/main_app/lnsp_app_state.dart';
import 'package:lnsp/presentation/view_models/main_app/lnsp_app_view_model.dart';

final lnspAppProvider = StateNotifierProvider.autoDispose<
    lnspAppViewModel, lnspAppState>(
  (ref) {
    final navigation = ref.watch(navigationProvider);

    return lnspAppViewModel(
      navigationHandler: navigation,
    );
  },
);
