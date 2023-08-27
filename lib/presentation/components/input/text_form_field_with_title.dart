import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:lnsp/gen/fonts.gen.dart';
import 'package:lnsp/presentation/components/components.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';
import 'package:lnsp/presentation/theme/radius_alias.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:lnsp/presentation/theme/styles.dart';

class TextFormFieldCustomWithTitle extends StatelessWidget {
  TextFormFieldCustomWithTitle(
      {Key? key,
      required this.title,
      this.obscureText = false,
      this.autofocus = false,
      this.focusNode,
      this.fontSize = FontAlias.fontAlias12,
      this.fontWeight,
      this.nextFocus,
      this.onFieldSubmitted,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.onChanged,
      this.textCapitalization = TextCapitalization.none,
      this.textAlign = TextAlign.start,
      this.inputFormatters,
      this.maxLength,
      this.maxLines = 1,
      this.enabled,
      this.validator,
      this.suffixIcon,
      this.prefixIcon,
      this.hintText,
      this.hintStyle,
      this.label,
      this.labelText,
      this.disabledLabelColor,
      this.errorText,
      this.counterText = "",
      this.onTap,
      this.readOnly = false,
      this.borderRadius,
      this.floatingLabelBehavior = FloatingLabelBehavior.auto,
      this.fillColor,
      this.filled,
      this.outlineColor,
      this.autovalidateMode,
      this.textColor,
      this.borderColor,
      this.borderWidth,
      this.showToolTip = false,
      this.textToolTip = "",
      this.tooltipController})
      : super(key: key);

  final String title;
  final bool obscureText;
  final bool autofocus;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int maxLines;
  final bool? enabled;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? label;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final bool? disabledLabelColor;
  final String? errorText;
  final String? counterText;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final FloatingLabelBehavior floatingLabelBehavior;
  final double? borderRadius;
  final Color? fillColor;
  final bool? filled;
  final Color? outlineColor;
  final AutovalidateMode? autovalidateMode;
  final TextAlign textAlign;
  final Color? textColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final double? borderWidth;
  final bool showToolTip;
  final String textToolTip;
  final JustTheController? tooltipController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LabelCustom(
              label: title,
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
            SpacingAlias.SizeWidth12,
            showToolTip
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: JustTheTooltip(
                      isModal: true,
                      content: Padding(
                        padding: EdgeInsets.all(8),
                        child:
                            LabelCustom(label: textToolTip, color: textColor),
                      ),
                      controller: tooltipController,
                      child: Material(
                        color: textColor,
                        shape: const CircleBorder(),
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(
                            Icons.question_mark,
                            color: Colors.white,
                            weight: 8,
                            size: 12,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
        TextFormField(
          obscureText: obscureText,
          autofocus: autofocus,
          autovalidateMode: autovalidateMode,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          inputFormatters: inputFormatters,
          controller: controller,
          onChanged: onChanged,
          maxLength: maxLength,
          textAlign: textAlign,
          maxLines: maxLines,
          readOnly: readOnly,
          enabled: enabled,
          validator: validator,
          cursorColor: AppColors.primary,
          style: Theme.of(context).textTheme.subtitle2,
          onTap: onTap,
          buildCounter: (BuildContext context,
              {int? currentLength, int? maxLength, bool? isFocused}) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "$currentLength",
                  style: TextStyle(
                    fontFamily: FontFamily.sFProTextRegular,
                    color: currentLength == 0
                        ? Color(0xffcccccc)
                        : AppColors.colorTextSecondary,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "/$maxLength",
                  style: TextStyle(
                    fontFamily: FontFamily.sFProTextRegular,
                    color: Color(0xffcccccc),
                    fontSize: 16,
                  ),
                ),
              ],
            );
          },
          decoration: InputDecoration(
            isDense: true,
            filled: filled,
            fillColor: fillColor,
            suffixIcon: suffixIcon,
            suffixIconConstraints: BoxConstraints(minHeight: 24, minWidth: 48),
            prefixIcon: prefixIcon,
            counterText: counterText,
            hintText: hintText,
            label: label,
            labelText: labelText,
            errorText: errorText,
            errorMaxLines: 2,
            errorStyle: const TextStyle(
                fontFamily: FontFamily.sFProTextRegular,
                color: Colors.red,
                fontSize: FontAlias.fontAlias12),
            labelStyle: Theme.of(context)
                .textTheme
                .subtitle3
                .copyWith(color: AppColors.colorTextBase),
            hintStyle: hintStyle ?? Theme.of(context).textTheme.button,
            contentPadding: EdgeInsets.symmetric(
                vertical: SpacingAlias.Spacing12,
                horizontal: SpacingAlias.Spacing10),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.underline),
              borderRadius:
                  BorderRadius.circular(borderRadius ?? RadiusAlias.Radius0),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.underline),
                borderRadius:
                    BorderRadius.circular(borderRadius ?? RadiusAlias.Radius0)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? AppColors.underline,
                width: borderWidth ?? 1,
              ),
            ),
            floatingLabelBehavior: floatingLabelBehavior,
          ),
        )
      ],
    );
  }
}
