import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/data/locals/app_preferences/app_preferences.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/input/text_form_label.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';

class SlideMenu extends HookConsumerWidget {
  const SlideMenu({Key? key}) : super(key: key);

  Widget listWidget(String title, Function onTap) => Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () => onTap.call(),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(title, style: const TextStyle(fontSize: 14)),
                    ),
                  ],
                ),
              ])),
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
        child: Material(
            color: const Color(0xFFF9F9F9),
            child: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top, bottom: 50),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            listWidget(LocaleKeys.logoutLabel.tr(), () {
                              /// TODO: implement logout logic
                            }),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FutureBuilder(
                        future: AppPreferences.getVersionApp(),
                        builder: (context, data) {
                          return LabelCustom(
                              fontSize: FontAlias.fontAlias16,
                              color: AppColors.grey1,
                              label:
                                  '''${LocaleKeys.version.tr()} ${data.data}''');
                        }),
                  )
                ],
              ),
            )));
  }
}
