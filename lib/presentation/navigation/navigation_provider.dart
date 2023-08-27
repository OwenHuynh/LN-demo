import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/presentation/navigation/navigation_handler.dart';

final navigationProvider = Provider<NavigationHandler>((ref) {
  return NavigationHandler();
});
