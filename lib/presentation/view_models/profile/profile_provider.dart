import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/presentation/navigation/navigation_provider.dart';
import 'package:lnsp/presentation/view_models/profile/profile_state.dart';
import 'package:lnsp/presentation/view_models/profile/profile_view_model.dart';

final profileProvider =
    StateNotifierProvider.autoDispose<ProfileViewModel, ProfileState>((ref) {
  final navigationHandler = ref.watch(navigationProvider);
  return ProfileViewModel(navigationHandler: navigationHandler);
});
