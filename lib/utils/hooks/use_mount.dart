import 'package:flutter/foundation.dart';
import 'package:lnsp/utils/hooks/use_effect_once.dart';

void useMount(VoidCallback fn) {
  return useEffectOnce(() {
    fn();
    return null;
  });
}
