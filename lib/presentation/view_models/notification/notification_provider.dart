import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/presentation/navigation/navigation_provider.dart';
import 'package:lnsp/presentation/view_models/notification/notification_state.dart';
import 'package:lnsp/presentation/view_models/notification/notification_view_model.dart';

final notificationProvider =
    StateNotifierProvider.autoDispose<NotificationViewModel, NotificationState>(
  (ref) {
    final navigationHandler = ref.watch(navigationProvider);

    return NotificationViewModel(
      navigationHandler: navigationHandler,
    );
  },
);
