import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/data/locals/app_preferences/app_preferences.dart';

final sessionControllerProvider =
    StateNotifierProvider<SessionController, String>((ref) {
  return SessionController('');
});

class SessionController extends StateNotifier<String> {
  SessionController(this._session) : super('');
  String? _session;

  Future<void> setSession(String id) async {
    _session = id;
    await AppPreferences().setSession(id);
  }

  Future<String?> getSession() async {
    return _session ??= await AppPreferences().getSession() ?? '';
  }

  String? get session => _session;

  Future<void> onInit() async {
    await getSession();
  }
}
