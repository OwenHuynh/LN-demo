import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lnsp/domain/repositories/login_repository.dart';
import 'package:lnsp/presentation/navigation/navigation_provider.dart';
import 'package:lnsp/presentation/view_models/login/login_state.dart';
import 'package:lnsp/presentation/view_models/login/login_view_model.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, LoginState>(
  (ref) {
    final navigationHandler = ref.watch(navigationProvider);
    final loginRepository = ref.watch(LoginRepositoryProvider);

    return LoginViewModel(
        navigationHandler: navigationHandler, loginRepository: loginRepository);
  },
);
