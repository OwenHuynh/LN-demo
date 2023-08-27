import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lnsp/utils/hooks/use_effect_once.dart';

void useUnmount(VoidCallback fn) {
  final fnRef = useRef(fn)..value = fn;
  return useEffectOnce(() => () => fnRef.value());
}
