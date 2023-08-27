import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/config/flavors.dart';
import 'package:lnsp/initialize.dart';
import 'package:lnsp/lnsp_app.dart';
import 'package:lnsp/presentation/view_models/base/logger_provider_observable.dart';

Future<void> main() async {
  F.appFlavor = Flavor.DEV;
  await initialize();
  runApp(
    ProviderScope(
        observers: []..addAll([LoggerProviderObservable()]),
        child: lnspApp()),
  );
}
