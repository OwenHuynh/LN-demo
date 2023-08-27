/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_hand.png
  AssetGenImage get icHand => const AssetGenImage('assets/icons/ic_hand.png');

  /// File path: assets/icons/ic_home.png
  AssetGenImage get icHome => const AssetGenImage('assets/icons/ic_home.png');

  /// File path: assets/icons/ic_home_selected.png
  AssetGenImage get icHomeSelected => const AssetGenImage('assets/icons/ic_home_selected.png');

  /// File path: assets/icons/ic_my_profile.png
  AssetGenImage get icMyProfile => const AssetGenImage('assets/icons/ic_my_profile.png');

  /// File path: assets/icons/ic_my_profile_selected.png
  AssetGenImage get icMyProfileSelected =>
      const AssetGenImage('assets/icons/ic_my_profile_selected.png');

  /// File path: assets/icons/ic_noti.png
  AssetGenImage get icNoti => const AssetGenImage('assets/icons/ic_noti.png');

  /// File path: assets/icons/ic_noti_selected.png
  AssetGenImage get icNotiSelected => const AssetGenImage('assets/icons/ic_noti_selected.png');

  /// File path: assets/icons/ic_pen.png
  AssetGenImage get icPen => const AssetGenImage('assets/icons/ic_pen.png');

  /// File path: assets/icons/ic_search.png
  AssetGenImage get icSearch => const AssetGenImage('assets/icons/ic_search.png');

  /// File path: assets/icons/ic_searched.png
  AssetGenImage get icSearched => const AssetGenImage('assets/icons/ic_searched.png');

  /// File path: assets/icons/ic_ticked.png
  AssetGenImage get icTicked => const AssetGenImage('assets/icons/ic_ticked.png');

  $AssetsIconsSvgGen get svg => const $AssetsIconsSvgGen();

  /// List of all assets
  List<AssetGenImage> get values => [
        icHand,
        icHome,
        icHomeSelected,
        icMyProfile,
        icMyProfileSelected,
        icNoti,
        icNotiSelected,
        icPen,
        icSearch,
        icSearched,
        icTicked
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/icon_app.png
  AssetGenImage get iconApp => const AssetGenImage('assets/images/icon_app.png');

  /// List of all assets
  List<AssetGenImage> get values => [iconApp];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en-US.json
  String get enUS => 'assets/translations/en-US.json';

  /// File path: assets/translations/ja-JP.json
  String get jaJP => 'assets/translations/ja-JP.json';

  /// List of all assets
  List<String> get values => [enUS, jaJP];
}

class $AssetsIconsSvgGen {
  const $AssetsIconsSvgGen();

  /// File path: assets/icons/svg/ic_account.svg
  SvgGenImage get icAccount => const SvgGenImage('assets/icons/svg/ic_account.svg');

  /// File path: assets/icons/svg/ic_bell.svg
  SvgGenImage get icBell => const SvgGenImage('assets/icons/svg/ic_bell.svg');

  /// File path: assets/icons/svg/ic_fire.svg
  SvgGenImage get icFire => const SvgGenImage('assets/icons/svg/ic_fire.svg');

  /// File path: assets/icons/svg/ic_handshake.svg
  SvgGenImage get icHandshake => const SvgGenImage('assets/icons/svg/ic_handshake.svg');

  /// File path: assets/icons/svg/ic_home.svg
  SvgGenImage get icHome => const SvgGenImage('assets/icons/svg/ic_home.svg');

  /// File path: assets/icons/svg/ic_question.svg
  SvgGenImage get icQuestion => const SvgGenImage('assets/icons/svg/ic_question.svg');

  /// File path: assets/icons/svg/ic_round-search.svg
  SvgGenImage get icRoundSearch => const SvgGenImage('assets/icons/svg/ic_round-search.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [icAccount, icBell, icFire, icHandshake, icHome, icQuestion, icRoundSearch];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
