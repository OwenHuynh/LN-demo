import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/box_painter/badge_triangle_painter.dart';
import 'package:lnsp/presentation/components/carousel_slider/carousel_indicators.dart';
import 'package:lnsp/presentation/components/carousel_slider/carousel_transforms.dart';
import 'package:lnsp/presentation/components/carousel_slider/carousel_wave.dart';
import 'package:lnsp/presentation/pages/home/home_tabs/activity_status_tab.dart';
import 'package:lnsp/presentation/pages/home/home_tabs/comment_tab.dart';
import 'package:lnsp/presentation/pages/home/home_tabs/home_root_tab.dart';
import 'package:lnsp/presentation/pages/home/home_widgets/app_bar_home_widget.dart';
import 'package:lnsp/presentation/pages/home/home_widgets/banner_item_selection_widget.dart';
import 'package:lnsp/presentation/pages/home/home_widgets/banner_item_widget.dart';
import 'package:lnsp/presentation/pages/home/home_widgets/my_sliver_persistent_header_delegate.dart';
import 'package:lnsp/presentation/pages/home/home_widgets/tab_item_widget.dart';
import 'package:lnsp/presentation/theme/colors.dart';

final List<String> mockTitleTextData = [
  "書道 VR体験 1",
  "書道 VR体験 2",
  "書道 VR体験 3",
  "書道 VR体験 4",
  "書道 VR体験 5",
  "書道 VR体験 6",
];

final List<String> mockDescriptionTextData = [
  "前衛書道家 岩坂典子 1",
  "前衛書道家 岩坂典子 2",
  "前衛書道家 岩坂典子 3",
  "前衛書道家 岩坂典子 4",
  "前衛書道家 岩坂典子 5",
  "前衛書道家 岩坂典子 6",
];

final List<String> mockData = [
  "https://cdn.pixabay.com/photo/2016/06/02/02/33/triangles-1430105__340.png",
  "https://www.mwallpapers.com/download-image/683469/1080x608",
  "https://images2.alphacoders.com/594/594767.jpg",
  "https://images8.alphacoders.com/943/thumb-1920-943754.png",
  "https://images7.alphacoders.com/401/thumb-1920-401390.png",
  "https://images7.alphacoders.com/401/thumb-1920-401390.png",
];

const double _kExpandedHeight = 360;

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final isSucceed = useState(true);
    final CarouselSliderController _sliderController =
        useMemoized(CarouselSliderController.new);

    return SafeArea(
      child: Scaffold(
        appBar: AppBarHomeWidget(
          title: LocaleKeys.projectPageLabel.tr(),
          shareCallBack: () {},
        ),
        backgroundColor: AppColors.backgroundHome,
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: AppColors.blueBg,
                  pinned: false,
                  expandedHeight: _kExpandedHeight,
                  flexibleSpace: FlexibleSpaceBar(
                    background: CarouselSliderWave.builder(
                      maxHeight: _kExpandedHeight,
                      unlimitedMode: true,
                      controller: _sliderController,
                      slideBuilder: (index) {
                        return BannerItemWidget(
                          imageUrl: mockData[index],
                          title: "${mockTitleTextData[index]}",
                        );
                      },
                      slideTransform: DefaultSlideTransform(),
                      slideIndicator: CircularWaveSlideIndicator(
                          padding: EdgeInsets.only(bottom: 12),
                          indicatorBorderColor: Colors.white,
                          indicatorRadius: 3,
                          renderItem: (index) {
                            return Text(
                              "${mockDescriptionTextData[index]}",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                              ),
                            );
                          }),
                      bottomWidget: BannerItemSelectionWidget(
                        onClickItem: _sliderController.jumToPage,
                        imageList: mockData,
                      ),
                      addWidgetInStack: Positioned.fill(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            foregroundDecoration: BadgeTrianglePainter(
                              badgeColor: isSucceed.value
                                  ? AppColors.badgeTriangleSuccess
                                  : AppColors.badgeTriangleFailed,
                              badgeSize: 90,
                              textSpan: TextSpan(
                                text: isSucceed.value
                                    ? LocaleKeys.succeedLabel.tr()
                                    : LocaleKeys.closedLabel.tr(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      itemCount: mockData.length,
                      initialPage: 0,
                      enableAutoSlider: true,
                    ),
                    stretchModes: [StretchMode.zoomBackground],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: MySliverPersistentHeaderDelegate(
                    minHeight: 36,
                    maxHeight: 36,
                    child: Container(
                      color: AppColors.backgroundBoxText,
                      child: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: Colors.grey,
                        labelColor: AppColors.blueBg,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: AppColors.white,
                        ),
                        indicatorWeight: 0,
                        labelPadding: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        tabs: [
                          TabItemWidget(title: LocaleKeys.homeTabLabel.tr()),
                          TabItemWidget(
                            title: LocaleKeys.activityStatusTabLabel.tr(),
                            countNotification: 8,
                          ),
                          TabItemWidget(
                            title: LocaleKeys.commentTabLabel.tr(),
                            countNotification: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                  pinned: true,
                  floating: true,
                ),
              ];
            },
            body: Container(
              child: TabBarView(
                children: [
                  HomeRootTab(),
                  ActivityStatusTab(),
                  CommentTab(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
