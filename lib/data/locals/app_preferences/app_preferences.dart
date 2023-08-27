import 'package:lnsp/data/locals/app_preferences/app_preferences_keys.dart';
import 'package:lnsp/domain/entities/user/user.dart';
import 'package:lnsp/domain/entities/user/user_detail.dart';
import 'package:lnsp/utils/device_util.dart';
import 'package:lnsp/utils/shared_preferences_util.dart';

class AppPreferences {
  Future<void> saveUserTokenInfo(
      {required String accessToken,
      required int expiresIn,
      required int timestamp}) async {
    await setAccessToken(accessToken);
    await setExpiresIn(expiresIn);
    await setTimestamp(timestamp);
  }

  static Future<void> setAccessToken(String token) async {
    await SharedPreferencesUtil.putString(
        AppPreferencesKeys.accessTokenKey, token);
  }

  static Future<String?> getAccessToken() async {
    final accessToken = await SharedPreferencesUtil.getString(
        AppPreferencesKeys.accessTokenKey);
    return accessToken;
  }

  static Future<void> setRefreshToken(String refreshToken) async {
    await SharedPreferencesUtil.putString(
        AppPreferencesKeys.refreshTokenKey, refreshToken);
  }

  static Future<String?> getRefreshToken() async {
    final refreshToken = await SharedPreferencesUtil.getString(
        AppPreferencesKeys.refreshTokenKey);
    return refreshToken;
  }

  static Future<void> setExpiresIn(int expires) async {
    await SharedPreferencesUtil.putString(
        AppPreferencesKeys.expiresInKey, expires.toString());
  }

  static Future<int> getExpiresIn() async {
    final expires =
        await SharedPreferencesUtil.getString(AppPreferencesKeys.expiresInKey);
    return int.parse(expires ?? "0");
  }

  static Future<void> setTimestamp(int timestamp) async {
    await SharedPreferencesUtil.putString(
        AppPreferencesKeys.timestampKey, timestamp.toString());
  }

  static Future<int> getTimestamp() async {
    final timestamp =
        await SharedPreferencesUtil.getString(AppPreferencesKeys.timestampKey);
    return int.parse(timestamp ?? "0");
  }

  static Future<void> deleteKey(String key) async {
    await SharedPreferencesUtil.deleteKey(key);
  }

  static Future<bool> isLogged() async {
    final result = await getAccessToken();
    if (result == null) {
      return false;
    }

    return result.isNotEmpty;
  }

  static Future<String> loadDeviceId() async {
    final uuidPreference =
        await SharedPreferencesUtil.getString(AppPreferencesKeys.deviceIdKey);

    if (uuidPreference == null) {
      final temp = DeviceUtil.deviceId;
      await SharedPreferencesUtil.deleteKey(AppPreferencesKeys.deviceIdKey);
      await SharedPreferencesUtil.putString(
          AppPreferencesKeys.deviceIdKey, temp);

      return temp;
    }

    return uuidPreference;
  }

  static Future<String?> getVersionApp() async {
    final versionApp =
        await SharedPreferencesUtil.getString(AppPreferencesKeys.versionAppKey);
    return versionApp;
  }

  static Future<void> setVersionApp(String version) async {
    await SharedPreferencesUtil.putString(
        AppPreferencesKeys.versionAppKey, version);
  }

  Future<String?> getSession() async {
    final session =
        await SharedPreferencesUtil.getString(AppPreferencesKeys.sessionKey);
    return session;
  }

  Future<void> setSession(String session) async {
    await SharedPreferencesUtil.putString(
        AppPreferencesKeys.sessionKey, session);
  }

  Future<String?> getLanguage() async {
    final data =
        await SharedPreferencesUtil.getString(AppPreferencesKeys.languageKey);
    return data;
  }

  Future<void> setLanguage(String language) async {
    await SharedPreferencesUtil.putString(
        AppPreferencesKeys.languageKey, language);
  }

  static Future<void> setProfileData(UserDetail userDetail) async {
    await SharedPreferencesUtil.putObject(
        AppPreferencesKeys.profileDataKey, userDetail);
  }
}
