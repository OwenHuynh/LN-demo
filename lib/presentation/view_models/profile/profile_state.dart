import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/presentation/view_models/base/base_state.dart';
import 'package:lnsp/utils/base/page_state.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState implements BaseState {
  factory ProfileState({
    @Default(PageState.initial) PageState pageState,
    @Default(false) bool isLogin,
    @Default(Locale('en', 'US')) Locale language,
    @Default(true) bool searchAllLanguage,
    @Default("") String nameCalled,
    String? nameCalledError,
    @Default("") String walletAddress,
    String? walletAddressError,
    @Default("") String emailAddress,
    String? emailError,
    @Default("") String password,
    String? passwordError,
    @Default("") String phoneNumber,
    String? phoneNumberError,
    @Default("") String termUrl,
    String? termUrlError,
    @Default("") String privacyUrl,
    String? privacyUrlError,
    @Default("") String commercialTransactionUrl,
    String? commercialTransactionUrlError,
    @Default("") String contactUrl,
    String? contactUrlError,
  }) = _ProfileState;
}
