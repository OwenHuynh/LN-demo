import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/box_text/box_text.dart';
import 'package:lnsp/presentation/components/carousel_slider/carousel_indicators.dart';
import 'package:lnsp/presentation/components/carousel_slider/carousel_transforms.dart';
import 'package:lnsp/presentation/components/carousel_slider/carousel_wave.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:lnsp/presentation/theme/styles.dart';

const double _kExpandedHeight = 240;

class SupportPlanItem extends HookConsumerWidget {
  SupportPlanItem({
    required this.title,
    required this.listUrlImageSlider,
    required this.bannerLeftValue,
    required this.currency,
    required this.peopleSupporting,
    required this.limitTo,
  });

  final String title;
  final List<String> listUrlImageSlider;
  final String bannerLeftValue;
  final double currency;
  final int peopleSupporting;
  final int limitTo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CarouselSliderController _sliderController =
        useMemoized(CarouselSliderController.new);

    return ExpandableNotifier(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 4), // shadow direction: bottom right
            )
          ],
        ),
        child: Builder(builder: (context) {
          final controller = ExpandableController.of(context, required: true)!;

          return Column(
            children: [
              SizedBox(
                height: _kExpandedHeight,
                child: CarouselSliderWave.builder(
                  maxHeight: _kExpandedHeight,
                  unlimitedMode: true,
                  controller: _sliderController,
                  slideBuilder: (index) {
                    return CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      imageUrl: listUrlImageSlider[index],
                    );
                  },
                  slideTransform: DefaultSlideTransform(),
                  slideIndicator: CircularWaveSlideIndicator(
                    showLine: false,
                    padding: EdgeInsets.only(bottom: 12),
                    indicatorBorderColor: Colors.white,
                    indicatorRadius: 3,
                  ),
                  addWidgetInStack: Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: BoxText(
                        text: bannerLeftValue,
                        textStyle: Theme.of(context).textTheme.text14.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                        color: AppColors.iconSelected,
                        radius: 0,
                      ),
                    ),
                  ),
                  itemCount: listUrlImageSlider.length,
                  initialPage: 0,
                  enableAutoSlider: false,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Column(
                  children: [
                    Expandable(
                      collapsed: buildCollapsed(context),
                      expanded: buildExpanded(context),
                    ),
                    SpacingAlias.SizeHeight16,
                    MaterialButton(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                      onPressed: controller.toggle,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              controller.expanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              size: 24,
                              color: Colors.blue,
                            ),
                            Text(
                              controller.expanded
                                  ? LocaleKeys.closeDetailLabel.tr()
                                  : LocaleKeys.showDetailLabel.tr(),
                              style:
                                  Theme.of(context).textTheme.text14.copyWith(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SpacingAlias.SizeHeight12,
                    Center(
                      child: Text(
                        LocaleKeys.onlyLittleLeftLabel.tr(),
                        style: Theme.of(context).textTheme.text12.copyWith(
                            color: AppColors.almostDone,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SpacingAlias.SizeHeight8,
                    MaterialButton(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      color: AppColors.bannerIndicator,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.helpBuyLabel.tr(),
                              style:
                                  Theme.of(context).textTheme.text16.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        height: 1.2,
                                      ),
                            ),
                            SpacingAlias.SizeWidth8,
                            BoxText(
                              text: "残り8",
                              textStyle: Theme.of(context).textTheme.text14,
                              radius: 0,
                              color: AppColors.white,
                              padding: EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 10),
                              borderColor: AppColors.iconSelected,
                              borderWidth: 2,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {},
                    ),
                    SpacingAlias.SizeHeight16,
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget buildExpanded(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...showWhenCollapsedOnTop(context),
        Text(
          "NEXT期待NFT",
          style: Theme.of(context).textTheme.text14.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        SpacingAlias.SizeHeight8,
        Text(
          "(1)プロジェクト発起人岩坂典子よりお礼のメッセージ"
          "をお送りします\n"
          "(2)希望により作品を1点贈呈させていただきます。(参"
          "考: 半切サイズ)",
          style: Theme.of(context).textTheme.text14,
        ),
      ],
    );
  }

  Widget buildCollapsed(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...showWhenCollapsedOnTop(context),
      ],
    );
  }

  List<Widget> showWhenCollapsedOnTop(BuildContext context) {
    final controller = ExpandableController.of(context, required: true)!;
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${currency}",
                  style: Theme.of(context).textTheme.text32.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.badgeNotification,
                      ),
                ),
                TextSpan(
                  text: " ${LocaleKeys.currencyEthUnitLabel.tr()}",
                  style: Theme.of(context).textTheme.text20.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.badgeNotification,
                      ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BoxText(
                text: "${LocaleKeys.limitLabel.tr()}${limitTo}",
                color: AppColors.box,
                textStyle: Theme.of(context).textTheme.text12.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.badgeNotification,
                    ),
              ),
              SpacingAlias.SizeHeight4,
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // TODO: Need change person icon
                  Icon(
                    Icons.person_outline,
                    size: 18,
                    color: AppColors.bannerIndicator,
                  ),
                  Text(
                    "${peopleSupporting}${LocaleKeys.peopleSupportingLabel.tr()}",
                    style: Theme.of(context).textTheme.text12.copyWith(
                          color: AppColors.bannerIndicator,
                        ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
      SpacingAlias.SizeHeight16,
      Text(
        "NFT内容",
        style: Theme.of(context).textTheme.text14.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      SpacingAlias.SizeHeight8,
      Text(
        "(1) facebook ウェブサイト・チラシ・ポスターに協賛企 業として、 "
        "企業ロゴと企業名を記載させていただきます。 (掲載保証期間1年)\n"
        "(2) 当イベントのプレスリリースに、 協賛企業として企 "
        "業ロゴと企業名を記載させていただきます\n"
        "(3) プロジェクト発起人岩坂典子よりお礼のメッセージ をお送りします\n"
        "(4) 希望により作品を1点贈呈させていただきます。 (参 考:半切サイズ) "
        "・必ず備考欄に企業名をご記入くださ い (機種依存文字はご利用いただけません)"
        "・公序良俗 に反する内容は掲載できかねますので、ご了承ください。 "
        "・業種によってはご相談させていただく場合がございます\n",
        maxLines: !controller.expanded ? 2 : null,
        overflow:
            !controller.expanded ? TextOverflow.ellipsis : TextOverflow.visible,
        style: Theme.of(context).textTheme.text14.copyWith(),
      ),
    ];
  }
}
