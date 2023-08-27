import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/data/locals/app_preferences/app_preferences.dart';
import 'package:lnsp/gen/fonts.gen.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/components.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:lnsp/presentation/view_models/profile/profile_provider.dart';
import 'package:lnsp/presentation/view_models/profile/profile_validate.dart';
import 'package:lnsp/utils/ui_util.dart';
import 'package:url_launcher/url_launcher.dart';

part 'my_account_dialog.dart';

class MyAccountPage extends ConsumerWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);

    Widget _RowItem(String title, Widget item, Function onTap) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 55,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: TextCommon(
                text: title,
                color: AppColors.primary,
                fontSize: FontAlias.fontAlias14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(child: item),
            SpacingAlias.SizeWidth20,
            InkWell(
              onTap: () => onTap.call(),
              child: Container(
                child: Image(image: AssetImage("assets/icons/ic_pen.png")),
              ),
            )
          ],
        ),
      );
    }

    Widget _URLItem(String url) {
      return InkWell(
        onTap: () async {
          if (Uri.tryParse(url) != null) {
            await launchUrl(Uri.parse(url));
          }
          // TODO: add dialog show can load link
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4)),
          child: TextCommon(
            text: LocaleKeys.urlString.tr(),
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: FontAlias.fontAlias14,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    Widget _TextItem(String text) {
      return TextCommon(
        text: text,
        fontSize: FontAlias.fontAlias16,
      );
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<String>(
                  future: getNameLanguage(state.language),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _RowItem(LocaleKeys.language.tr(),
                          _TextItem(snapshot.data.toString()), () {
                        UIUtil.showCustomDialog(LanguageDialog(),
                            borderRadius: 6, barrierDismissible: true);
                      });
                    }
                    return SizedBox();
                  }),
              _RowItem(
                  LocaleKeys.searchMyProfile.tr(),
                  _TextItem(state.searchAllLanguage
                      ? LocaleKeys.everyLanguage.tr()
                      : LocaleKeys.selectedLanguageOnly.tr()), () {
                UIUtil.showCustomDialog(SearchDialog(),
                    borderRadius: 6, barrierDismissible: true);
              }),
              _RowItem(LocaleKeys.nameCalled.tr(), _TextItem(state.nameCalled),
                  () {
                UIUtil.showCustomDialog(NameCardDialog(),
                    borderRadius: 6, barrierDismissible: true);
              }),
              _RowItem(
                  LocaleKeys.walletAddress.tr(), _TextItem(state.walletAddress),
                  () {
                UIUtil.showCustomDialog(WalletAddressDialog(),
                    borderRadius: 6, barrierDismissible: true);
              }),
              _RowItem(
                  LocaleKeys.emailMyProfile.tr(), _TextItem(state.emailAddress),
                  () {
                UIUtil.showCustomDialog(EmailDialog(),
                    borderRadius: 6, barrierDismissible: true);
              }),
              _RowItem(LocaleKeys.password.tr(),
                  PasswordWidget(password: state.password), () {
                UIUtil.showCustomDialog(PasswordDialog(),
                    borderRadius: 6, barrierDismissible: true);
              }),
              _RowItem(LocaleKeys.phoneNumberMyProfile.tr(),
                  _TextItem(state.phoneNumber), () {
                UIUtil.showCustomDialog(PhoneNumberDialog(),
                    borderRadius: 6, barrierDismissible: true);
              }),
              _RowItem(LocaleKeys.termOfServices.tr(), _URLItem(state.termUrl),
                  () {
                UIUtil.showCustomDialog(TermDialog(),
                    borderRadius: 6, barrierDismissible: true);
              }),
              _RowItem(LocaleKeys.privacyPolicyMyProfile.tr(),
                  _URLItem(state.privacyUrl), () {
                UIUtil.showCustomDialog(PrivacyDialog(),
                    borderRadius: 6, barrierDismissible: true);
              }),
              _RowItem(LocaleKeys.specifiedCommercialTransactionArt.tr(),
                  _URLItem(state.commercialTransactionUrl), () {
                UIUtil.showCustomDialog(CommercialTransactionDialog(),
                    borderRadius: 6, barrierDismissible: true);
              }),
              _RowItem(LocaleKeys.contact.tr(), _URLItem(state.contactUrl), () {
                UIUtil.showCustomDialog(ContactDialog(),
                    borderRadius: 6, barrierDismissible: true);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordWidget extends StatelessWidget {
  PasswordWidget({Key? key, required this.password}) : super(key: key);

  final String password;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller =
        TextEditingController(text: password);

    return TextField(
      controller: _controller,
      style: TextStyle(
        fontFamily: FontFamily.sFProTextRegular,
        color: AppColors.colorTextBase,
        fontSize: FontAlias.fontAlias16,
        fontWeight: FontWeight.w600,
      ),
      readOnly: true,
      obscureText: true,
      decoration: InputDecoration(
        isDense: true,
        hintText: password,
        border: InputBorder.none,
      ),
    );
  }
}
