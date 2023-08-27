import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';

Widget customDropDown<String>(
    {double? width,
    Widget? hint,
    List<DropdownMenuItem<String>>? items,
    List<String> data = const [],
    required String? value,
    required Function(String? value) onChange}) {
  return Builder(builder: (context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SpacingAlias.Spacing6),
      decoration: BoxDecoration(border: Border.all(color: AppColors.grey)),
      child: SizedBox(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonHideUnderline(
              child: DropdownButton(
            hint: hint,
            value: value == LocaleKeys.threeDash.tr() ? null : value,
            icon: Icon(Icons.expand_more),
            items: items ??
                data.map((element) {
                  return DropdownMenuItem<String>(
                    value: element,
                    child: Container(
                        width: width, child: Text(element.toString())),
                  );
                }).toList(),
            onChanged: onChange,
          )),
        ),
      ),
    );
  });
}
