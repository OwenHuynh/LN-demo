import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/presentation/components/activity_status_item/activity_status_item.dart';
import 'package:lnsp/presentation/components/paginate/button_arrow.dart';
import 'package:lnsp/presentation/components/paginate/pagination_container.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:lnsp/utils/screen_util.dart';

class ActivityStatusTab extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = useState<int>(1);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SpacingAlias.SizeHeight8,
            Container(
              width: ScreenUtil.deviceWidth,
              color: AppColors.box,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpacingAlias.SizeHeight32,
                  ActivityStatusItem(
                    title: "1月24日にイベントを行います!",
                    time: "2022.01.18",
                    videoId: "",
                    imageUrl:
                        "https://images7.alphacoders.com/401/thumb-1920-401390.png",
                    commentCount: 3,
                    description: "世界で類をみない! VR (仮想世界での作品) XR(実作"
                        "品)の大規模アート書道展! 書道を 「VR (仮想世界での"
                        "作品)」と「R(実作品) 」 で表現する、 世界で類をみな"
                        "い前衛アート書道の展示イベントを開催します。\n\n"
                        "制作の様子を20秒程度の動画にしております。 イメージ"
                        "するのが難しいとおもいますのでぜひ一度目を通してい"
                        "ただけますと幸いです。\n\n"
                        "企画者の前衛書道家岩坂典子と申します。 私は、3歳の時"
                        "から「書」 の道を歩み、 現在は 「前衛書道家｣として活"
                        "動をしています。",
                    commentCallBack: () {},
                  ),
                  SpacingAlias.SizeHeight32,
                  ActivityStatusItem(
                    title: "1月24日にイベントを行います!",
                    time: "2022.01.18",
                    videoId: "Svtr-p4mrQ8",
                    isVideo: true,
                    imageUrl:
                        "https://images7.alphacoders.com/401/thumb-1920-401390.png",
                    commentCount: 0,
                    description: "世界で類をみない! VR (仮想世界での作品) XR(実作"
                        "品)の大規模アート書道展! 書道を 「VR (仮想世界での"
                        "作品)」と「R(実作品) 」 で表現する、 世界で類をみな"
                        "い前衛アート書道の展示イベントを開催します。\n\n"
                        "制作の様子を20秒程度の動画にしております。 イメージ"
                        "するのが難しいとおもいますのでぜひ一度目を通してい"
                        "ただけますと幸いです。\n\n"
                        "企画者の前衛書道家岩坂典子と申します。 私は、3歳の時"
                        "から「書」 の道を歩み、 現在は 「前衛書道家｣として活"
                        "動をしています。",
                    commentCallBack: () {},
                  ),
                  SpacingAlias.SizeHeight32,
                  Pagination(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 40,
                    paginateButtonStyles: PaginateButtonArrowStyles(),
                    prevButtonStyles: PaginateSkipButton(
                      borderRadius: BorderRadius.zero,
                    ),
                    nextButtonStyles: PaginateSkipButton(
                      borderRadius: BorderRadius.zero,
                    ),
                    onPageChange: (number) {
                      currentPage.value = number;
                    },
                    useGroup: true,
                    totalPage: 30,
                    show: 5,
                    currentPage: currentPage.value,
                  ),
                  SpacingAlias.SizeHeight32,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
