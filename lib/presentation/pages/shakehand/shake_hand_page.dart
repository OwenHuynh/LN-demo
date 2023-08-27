import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lnsp/generated/locale_keys.g.dart';

class ShakeHandPage extends StatelessWidget {
  const ShakeHandPage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text(LocaleKeys.pleaseAddContent.tr()),
          ),
        ),
      );
}
