part of 'my_account_page.dart';

enum language { ENGLISH, JAPAN }

extension languageExt on language {
  Locale get locale {
    switch (this) {
      case language.ENGLISH:
        return Locale('en', 'US');
      case language.JAPAN:
        return Locale('ja', 'JP');
    }
  }

  String get name {
    switch (this) {
      case language.ENGLISH:
        return LocaleKeys.englishLabel.tr();
      case language.JAPAN:
        return LocaleKeys.japanLabel.tr();
    }
  }
}

Future<String> getNameLanguage(Locale state) async {
  final localLang = await AppPreferences().getLanguage();
  switch (localLang) {
    case "ja":
      {
        return language.JAPAN.name;
      }
    case "en":
      {
        return language.ENGLISH.name;
      }
    default:
      return language.ENGLISH.name;
  }
}

class LanguageDialog extends HookConsumerWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageSelected = ref.watch(profileProvider).language;
    final _languageTemple = useState(languageSelected);

    return DialogTemplate(LocaleKeys.language.tr(), () {}, () async {
      await ref
          .read(profileProvider.notifier)
          .onChangeLanguage(_languageTemple.value);
      await context.setLocale(_languageTemple.value);
    },
        true,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: AppColors.grey50,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.grey60)),
              width: 200,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Locale>(
                  value: _languageTemple.value,
                  items: language.values
                      .map((e) => DropdownMenuItem<Locale>(
                            value: e.locale,
                            child: TextCommon(
                              text: e.name,
                              fontSize: FontAlias.fontAlias14,
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    _languageTemple.value = value ?? language.ENGLISH.locale;
                  },
                  isExpanded: true,
                  isDense: true,
                ),
              ),
            ),
          ],
        ));
  }
}

class SearchDialog extends HookConsumerWidget {
  SearchDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> _listSearch = [
      LocaleKeys.selectedLanguageOnly.tr(),
      LocaleKeys.everyLanguage.tr(),
    ];

    final searchType = ref.watch(profileProvider).searchAllLanguage;

    final _selected =
        useState(searchType ? _listSearch.last : _listSearch.first);
    return DialogTemplate(
      LocaleKeys.searchMyProfile.tr(),
      () {},
      () {
        ref
            .read(profileProvider.notifier)
            .onChangeSearchType(_selected == _listSearch.last);
      },
      true,
      Container(
        child: Column(
          children: [
            RadioListTile(
              title: Text(_listSearch.first),
              value: _listSearch.first,
              groupValue: _selected.value,
              dense: true,
              contentPadding: EdgeInsets.zero,
              activeColor: AppColors.yellow,
              tileColor: AppColors.yellow,
              selectedTileColor: AppColors.yellow,
              onChanged: (value) {
                _selected.value = value?.toString() ?? _listSearch.first;
              },
            ),
            RadioListTile(
              title: Text(_listSearch.last),
              value: _listSearch.last,
              groupValue: _selected.value,
              dense: true,
              contentPadding: EdgeInsets.zero,
              activeColor: AppColors.yellow,
              tileColor: AppColors.yellow,
              selectedTileColor: AppColors.yellow,
              onChanged: (value) {
                _selected.value = value?.toString() ?? _listSearch.last;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NameCardDialog extends HookConsumerWidget {
  NameCardDialog({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textError = ref.watch(profileProvider).nameCalledError;
    final nameCalled = ref.watch(profileProvider).nameCalled;

    final nameCalledTemple = useState("");

    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        _controller.text = nameCalled;
      }
      return;
    }, []);

    return DialogTemplate(LocaleKeys.nameCalled.tr(), () {}, () {
      ref
          .read(profileProvider.notifier)
          .onChangeNameCalled(nameCalledTemple.value);
    },
        textError == null && nameCalledTemple.value.isNotEmpty,
        Container(
          padding: EdgeInsets.only(bottom: 20),
          child: TextFormFieldCustom(
            borderRadius: 6,
            controller: _controller,
            onChanged: (value) {
              ref.read(profileProvider.notifier).onInputNameCalled(value);
              nameCalledTemple.value = _controller.text;
            },
            errorText: textError,
          ),
        ));
  }
}

class WalletAddressDialog extends HookConsumerWidget {
  WalletAddressDialog({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textError = ref.watch(profileProvider).walletAddressError;
    final walletAddress = ref.watch(profileProvider).walletAddress;

    final walletAddressTemple = useState("");

    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        _controller.text = walletAddress;
      }
      return;
    }, []);

    return DialogTemplate(LocaleKeys.walletAddress.tr(), () {}, () {
      ref
          .read(profileProvider.notifier)
          .onChangeWalletAddress(_controller.text);
    },
        textError == null && walletAddressTemple.value.isNotEmpty,
        Container(
          padding: EdgeInsets.only(bottom: 20),
          child: TextFormFieldCustom(
            borderRadius: 6,
            controller: _controller,
            onChanged: (value) {
              ref.read(profileProvider.notifier).onInputWalletAddress(value);
              walletAddressTemple.value = _controller.text;
            },
            errorText: textError,
          ),
        ));
  }
}

class EmailDialog extends HookConsumerWidget {
  EmailDialog({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textError = ref.watch(profileProvider).emailError;
    final emailAddress = ref.watch(profileProvider).emailAddress;

    final emailAddressTemple = useState("");

    final isMounted = useIsMounted();
    useEffect(() {
      if (isMounted()) {
        _controller.text = emailAddress;
      }
      return;
    }, []);

    return DialogTemplate(LocaleKeys.emailMyProfile.tr(), () {}, () {
      ref.read(profileProvider.notifier).onChangeEmailAddress(_controller.text);
    },
        textError == null && emailAddressTemple.value.isNotEmpty,
        Container(
          padding: EdgeInsets.only(bottom: 20),
          child: TextFormFieldCustom(
            borderRadius: 6,
            controller: _controller,
            onChanged: (value) {
              ref.read(profileProvider.notifier).onInputEmailAddress(value);
              emailAddressTemple.value = _controller.text;
            },
            errorText: textError,
          ),
        ));
  }
}

class PasswordDialog extends HookConsumerWidget {
  PasswordDialog({Key? key}) : super(key: key);

  final TextEditingController _currendPwdcontroller = TextEditingController();
  final TextEditingController _newPwdcontroller = TextEditingController();
  final TextEditingController _confirmNewPwdcontroller =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _currentError = useState("");
    final _newError = useState("");
    final _confirmNewError = useState("");

    return DialogTemplate(LocaleKeys.password.tr(), () {}, () {
      ref
          .read(profileProvider.notifier)
          .onChangePassword(_newPwdcontroller.text);
    },
        _currentError.value.isEmpty &&
            _newError.value.isEmpty &&
            _confirmNewError.value.isEmpty &&
            _confirmNewPwdcontroller.text.isNotEmpty &&
            _confirmNewPwdcontroller.text.isNotEmpty,
        Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCommon(
                text: LocaleKeys.currentPassword.tr(),
                fontSize: FontAlias.fontAlias14,
                fontWeight: FontWeight.bold,
              ),
              SpacingAlias.SizeHeight10,
              TextFormFieldCustom(
                borderRadius: 6,
                obscureText: true,
                controller: _currendPwdcontroller,
                onChanged: (value) {
                  _currentError.value =
                      ProfileValidationResults.validatePassword(
                                  _currendPwdcontroller.text)
                              .errorMessage ??
                          "";
                },
                errorText:
                    _currentError.value.isEmpty ? null : _currentError.value,
              ),
              SpacingAlias.SizeHeight10,
              InkWell(
                onTap: () {},
                child: TextCommon(
                  text: LocaleKeys.forgotPassword.tr(),
                  fontSize: FontAlias.fontAlias12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blue,
                ),
              ),
              SpacingAlias.SizeHeight24,
              TextCommon(
                text: LocaleKeys.newPassword.tr(),
                fontSize: FontAlias.fontAlias14,
                fontWeight: FontWeight.bold,
              ),
              SpacingAlias.SizeHeight10,
              TextFormFieldCustom(
                obscureText: true,
                borderRadius: 6,
                controller: _newPwdcontroller,
                onChanged: (value) {
                  _newError.value = ProfileValidationResults.validatePassword(
                              _newPwdcontroller.text)
                          .errorMessage ??
                      "";
                },
                errorText: _newError.value.isEmpty ? null : _newError.value,
              ),
              SpacingAlias.SizeHeight10,
              TextCommon(
                text: LocaleKeys.confirmNewPassword.tr(),
                fontSize: FontAlias.fontAlias14,
                fontWeight: FontWeight.bold,
              ),
              SpacingAlias.SizeHeight10,
              TextFormFieldCustom(
                obscureText: true,
                borderRadius: 6,
                controller: _confirmNewPwdcontroller,
                onChanged: (value) {
                  _confirmNewError.value =
                      ProfileValidationResults.validateConfirmPassword(
                                  _newPwdcontroller.text,
                                  _confirmNewPwdcontroller.text)
                              .errorMessage ??
                          "";
                },
                errorText: _confirmNewError.value.isEmpty
                    ? null
                    : _confirmNewError.value,
              ),
            ],
          ),
        ));
  }
}

class PhoneNumberDialog extends HookConsumerWidget {
  PhoneNumberDialog({Key? key}) : super(key: key);

  final TextEditingController _controllerPhoneNumer = TextEditingController();
  final TextEditingController _controllerSMSCode = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneNumberCurrent = ref.watch(profileProvider).phoneNumber;
    final phoneNumberError = ref.watch(profileProvider).phoneNumberError;
    final codeError = useState("");

    final isNext = useState(false);
    final isChange = useState(false);

    return Container(
      constraints: BoxConstraints(
        minHeight: 100,
        minWidth: 200,
      ),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(6)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: isChange.value
          ? Column(
              children: [
                SpacingAlias.SizeHeight10,
                Row(
                  children: [
                    Image(
                      image: AssetImage("assets/icons/ic_ticked.png"),
                    ),
                    SpacingAlias.SizeWidth20,
                    TextCommon(text: LocaleKeys.confirmUpdateMsg.tr()),
                  ],
                ),
                SpacingAlias.SizeHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        height: 40,
                        width: 100,
                        child: FlatButtonComponent(
                          textColor: AppColors.colorTextBase,
                          color: AppColors.yellow,
                          title: LocaleKeys.okLabel.tr(),
                          onPressed: () => Navigator.of(context).pop(),
                          padding: EdgeInsets.zero,
                          elevation: 4,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                )
              ],
            )
          : isNext.value
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextCommon(
                      text: LocaleKeys.confirmSmsText.tr(),
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    SpacingAlias.SizeHeight20,
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCommon(
                            text: LocaleKeys.enterSMSCode.tr(),
                            color: AppColors.grey60,
                            fontWeight: FontWeight.bold,
                            fontSize: FontAlias.fontAlias14,
                          ),
                          SpacingAlias.SizeHeight10,
                          TextFormFieldCustom(
                            autofocus: false,
                            borderRadius: 6,
                            controller: _controllerSMSCode,
                            onChanged: (value) {
                              codeError.value =
                                  ProfileValidationResults.validateCode(value)
                                          .errorMessage ??
                                      "";
                            },
                            keyboardType: TextInputType.number,
                            errorText: codeError.value.isEmpty
                                ? null
                                : codeError.value,
                          ),
                          SpacingAlias.SizeHeight24,
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            height: 40,
                            child: FlatButtonOutlinedComponent(
                              borderColor: AppColors.white,
                              title: LocaleKeys.resendCodeLabel.tr(),
                              onPressed: () {
                                ref
                                    .read(profileProvider.notifier)
                                    .onResendSMSCode();
                              },
                              padding: EdgeInsets.zero,
                              fontWeight: FontWeight.bold,
                              colorText: AppColors.yellow,
                            )),
                        SpacingAlias.SizeHeight16,
                        SizedBox(
                          height: 40,
                          child: FlatButtonComponent(
                            textColor: AppColors.colorTextBase,
                            color: AppColors.yellow,
                            title: LocaleKeys.verifyLabel.tr(),
                            enabled: _controllerSMSCode.text.isNotEmpty,
                            onPressed: () {
                              ref
                                  .read(profileProvider.notifier)
                                  .onChangePhoneNumber(_controllerSMSCode.text,
                                      _controllerPhoneNumer.text);
                              isChange.value = true;
                            },
                            padding: EdgeInsets.zero,
                            elevation: 4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SpacingAlias.SizeHeight16,
                        SizedBox(
                            height: 40,
                            child: FlatButtonOutlinedComponent(
                              borderColor: AppColors.white,
                              title: LocaleKeys.cancelLabel.tr(),
                              onPressed: () {
                                isNext.value = false;
                              },
                              padding: EdgeInsets.zero,
                              fontWeight: FontWeight.bold,
                              colorText: AppColors.yellow,
                            )),
                      ],
                    )
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        TextCommon(
                          text: LocaleKeys.phoneNumberMyProfile.tr(),
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SpacingAlias.SizeHeight20,
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCommon(
                            text: LocaleKeys.currentPhoneNumber.tr(),
                            color: AppColors.grey60,
                            fontWeight: FontWeight.bold,
                            fontSize: FontAlias.fontAlias14,
                          ),
                          SpacingAlias.SizeHeight10,
                          TextFormFieldCustom(
                            autofocus: false,
                            borderRadius: 6,
                            controller: _controllerPhoneNumer,
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              ref
                                  .read(profileProvider.notifier)
                                  .onInputPhoneNumber(value);
                            },
                            errorText: phoneNumberError,
                          ),
                          SpacingAlias.SizeHeight24,
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            height: 40,
                            width: 100,
                            child: FlatButtonOutlinedComponent(
                              borderColor: AppColors.white,
                              title: LocaleKeys.cancelLabel.tr(),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              padding: EdgeInsets.zero,
                              fontWeight: FontWeight.bold,
                              colorText: AppColors.yellow,
                            )),
                        SizedBox(
                            height: 40,
                            width: 100,
                            child: FlatButtonComponent(
                              textColor: AppColors.colorTextBase,
                              color: AppColors.yellow,
                              title: LocaleKeys.nextLabel.tr(),
                              enabled: phoneNumberError == null &&
                                  _controllerPhoneNumer.text.isNotEmpty,
                              onPressed: () {
                                isNext.value = true;
                              },
                              padding: EdgeInsets.zero,
                              elevation: 4,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    )
                  ],
                ),
    );
  }
}

class TermDialog extends HookConsumerWidget {
  TermDialog({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultTerm = ref.watch(profileProvider).termUrl;
    final errorUrl = ref.watch(profileProvider).termUrlError;

    useEffect(() {
      _controller.text = defaultTerm;
      return;
    }, []);
    return DialogTemplate(LocaleKeys.termOfServices.tr(), () {}, () {
      ref.read(profileProvider.notifier).onChangeTermUrl(_controller.text);
    },
        errorUrl == null && _controller.text.isNotEmpty,
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormFieldCustom(
                autofocus: false,
                borderRadius: 6,
                controller: _controller,
                errorText: errorUrl,
                onChanged: (value) {
                  ref.read(profileProvider.notifier).onInputTermUrl(value);
                },
              ),
              SpacingAlias.SizeHeight10,
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(defaultTerm));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCommon(
                      text: LocaleKeys.confirmURL.tr(),
                      color: AppColors.blue,
                    ),
                    Icon(
                      Icons.launch,
                      size: 20,
                      color: AppColors.blue,
                    )
                  ],
                ),
              ),
              SpacingAlias.SizeHeight10,
            ],
          ),
        ));
  }
}

class PrivacyDialog extends HookConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultPrivacy = ref.watch(profileProvider).privacyUrl;
    final errorUrl = ref.watch(profileProvider).privacyUrlError;

    useEffect(() {
      _controller.text = defaultPrivacy;
      return;
    }, []);
    return DialogTemplate(LocaleKeys.privacyPolicyMyProfile.tr(), () {}, () {
      ref.read(profileProvider.notifier).onChangePrivacyUrl(_controller.text);
    },
        errorUrl == null && _controller.text.isNotEmpty,
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormFieldCustom(
                autofocus: false,
                borderRadius: 6,
                controller: _controller,
                errorText: errorUrl,
                onChanged: (value) {
                  ref.read(profileProvider.notifier).onInputPrivacyUrl(value);
                },
              ),
              SpacingAlias.SizeHeight10,
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(defaultPrivacy));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCommon(
                      text: LocaleKeys.confirmURL.tr(),
                      color: AppColors.blue,
                    ),
                    Icon(
                      Icons.launch,
                      size: 20,
                      color: AppColors.blue,
                    )
                  ],
                ),
              ),
              SpacingAlias.SizeHeight10,
            ],
          ),
        ));
  }
}

class CommercialTransactionDialog extends HookConsumerWidget {
  CommercialTransactionDialog({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultCommercialTransaction =
        ref.watch(profileProvider).commercialTransactionUrl;
    final errorUrl = ref.watch(profileProvider).commercialTransactionUrlError;

    useEffect(() {
      _controller.text = defaultCommercialTransaction;
      return;
    }, []);
    return DialogTemplate(
        LocaleKeys.specifiedCommercialTransactionArt.tr(), () {}, () {
      ref
          .read(profileProvider.notifier)
          .onChangeCommercialTransactionUrl(_controller.text);
    },
        errorUrl == null && _controller.text.isNotEmpty,
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormFieldCustom(
                autofocus: false,
                borderRadius: 6,
                controller: _controller,
                errorText: errorUrl,
                onChanged: (value) {
                  ref
                      .read(profileProvider.notifier)
                      .onInputCommercialTransactionUrl(value);
                },
              ),
              SpacingAlias.SizeHeight10,
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(defaultCommercialTransaction));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCommon(
                      text: LocaleKeys.confirmURL.tr(),
                      color: AppColors.blue,
                    ),
                    Icon(
                      Icons.launch,
                      size: 20,
                      color: AppColors.blue,
                    )
                  ],
                ),
              ),
              SpacingAlias.SizeHeight10,
            ],
          ),
        ));
  }
}

class ContactDialog extends HookConsumerWidget {
  ContactDialog({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultContact = ref.watch(profileProvider).contactUrl;
    final errorUrl = ref.watch(profileProvider).contactUrlError;

    useEffect(() {
      _controller.text = defaultContact;
      return;
    }, []);
    return DialogTemplate(
        LocaleKeys.specifiedCommercialTransactionArt.tr(), () {}, () {
      ref.read(profileProvider.notifier).onChangeContactUrl(_controller.text);
    },
        errorUrl == null && _controller.text.isNotEmpty,
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormFieldCustom(
                autofocus: false,
                borderRadius: 6,
                controller: _controller,
                errorText: errorUrl,
                onChanged: (value) {
                  ref.read(profileProvider.notifier).onInputContactUrl(value);
                },
              ),
              SpacingAlias.SizeHeight10,
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(defaultContact));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCommon(
                      text: LocaleKeys.confirmURL.tr(),
                      color: AppColors.blue,
                    ),
                    Icon(
                      Icons.launch,
                      size: 20,
                      color: AppColors.blue,
                    )
                  ],
                ),
              ),
              SpacingAlias.SizeHeight10,
            ],
          ),
        ));
  }
}

class DialogTemplate extends HookWidget {
  DialogTemplate(
    this.title,
    this.onCancel,
    this.onChange,
    this.enableChange,
    this.body,
  );

  final String title;
  final Function onCancel;
  final Function onChange;
  final Widget body;
  final bool enableChange;

  @override
  Widget build(BuildContext context) {
    final isChange = useState(false);

    return Container(
      constraints: BoxConstraints(
        minHeight: 100,
        minWidth: 200,
      ),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(6)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: isChange.value
          ? Column(
              children: [
                SpacingAlias.SizeHeight10,
                Row(
                  children: [
                    Image(
                      image: AssetImage("assets/icons/ic_ticked.png"),
                    ),
                    SpacingAlias.SizeWidth20,
                    TextCommon(text: LocaleKeys.confirmUpdateMsg.tr()),
                  ],
                ),
                SpacingAlias.SizeHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        height: 40,
                        width: 100,
                        child: FlatButtonComponent(
                          textColor: AppColors.colorTextBase,
                          color: AppColors.yellow,
                          title: LocaleKeys.okLabel.tr(),
                          onPressed: () => Navigator.of(context).pop(),
                          padding: EdgeInsets.zero,
                          elevation: 4,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                )
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    TextCommon(
                      text: title,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SpacingAlias.SizeHeight20,
                body,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        height: 40,
                        width: 100,
                        child: FlatButtonOutlinedComponent(
                          borderColor: AppColors.white,
                          title: LocaleKeys.cancelLabel.tr(),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          padding: EdgeInsets.zero,
                          fontWeight: FontWeight.bold,
                          colorText: AppColors.yellow,
                        )),
                    SizedBox(
                        height: 40,
                        width: 100,
                        child: FlatButtonComponent(
                          textColor: AppColors.colorTextBase,
                          color: AppColors.yellow,
                          title: LocaleKeys.changeLabel.tr(),
                          enabled: enableChange,
                          onPressed: () {
                            onChange.call();
                            isChange.value = true;
                          },
                          padding: EdgeInsets.zero,
                          elevation: 4,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                )
              ],
            ),
    );
  }
}
