import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lnsp/data/locals/app_preferences/app_preferences.dart';
import 'package:lnsp/presentation/navigation/navigation_handler.dart';
import 'package:lnsp/presentation/view_models/base/base_view_model.dart';
import 'package:lnsp/presentation/view_models/main_app/lnsp_app_state.dart';
import 'package:package_info_plus/package_info_plus.dart';

class lnspAppViewModel extends BaseViewModel<lnspAppState> {
  lnspAppViewModel({
    required this.navigationHandler,
  }) : super(lnspAppState.initial());

  final NavigationHandler navigationHandler;

  @override
  Future<void> dispose() async {
    super.dispose();
  }

  @override
  Future<void> onInit() async {
    await onSaveInfo();
    if (await checkInfo()) {}
  }

  Future<void> init() async {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  Future<bool> checkInfo() async {
    final version = await AppPreferences.getVersionApp();
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String versionCurrent = packageInfo.version;
    if (version == null || versionCurrent != version) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> onSaveInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String version = packageInfo.version;
    await AppPreferences.setVersionApp(version);
  }
}
