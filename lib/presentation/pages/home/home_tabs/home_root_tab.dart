import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/avatar/avatar_circular.dart';
import 'package:lnsp/presentation/components/box_painter/custom_track_shape.dart';
import 'package:lnsp/presentation/components/box_text/box_text.dart';
import 'package:lnsp/presentation/components/box_text/circular_text.dart';
import 'package:lnsp/presentation/components/box_text/text_status.dart';
import 'package:lnsp/presentation/components/buttons/button_export.dart';
import 'package:lnsp/presentation/components/comment_item/comment_item.dart';
import 'package:lnsp/presentation/components/icon_text/icon_text.dart';
import 'package:lnsp/presentation/components/originator_project_item/originator_project_item.dart';
import 'package:lnsp/presentation/components/support_plan_item/support_plan_item.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:lnsp/presentation/theme/styles.dart';
import 'package:lnsp/utils/screen_util.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

final List<String> mockData = [
  "https://cdn.pixabay.com/photo/2016/06/02/02/33/triangles-1430105__340.png",
  "https://www.mwallpapers.com/download-image/683469/1080x608",
  "https://images2.alphacoders.com/594/594767.jpg",
  "https://images8.alphacoders.com/943/thumb-1920-943754.png",
  "https://images7.alphacoders.com/401/thumb-1920-401390.png",
  "https://images7.alphacoders.com/401/thumb-1920-401390.png",
];

class HomeRootTab extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = useRef(
      YoutubePlayerController.fromVideoId(
        // TODO: example youtubeID
        videoId: "Svtr-p4mrQ8",
        autoPlay: false,
        params: const YoutubePlayerParams(showFullscreenButton: true),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "【神戸ハーバーランドにて開催】vRx現実x前衛アート書プロジェクト",
                    style: Theme.of(context).textTheme.title,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "購入総額",
                        style: Theme.of(context)
                            .textTheme
                            .text16
                            .copyWith(color: AppColors.blueBg),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BoxText(
                            text: "残り18日",
                          ),
                          Text(
                            "達成率",
                            style: Theme.of(context).textTheme.text14.copyWith(
                                  color: AppColors.bannerIndicator,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "3.012",
                              style:
                                  Theme.of(context).textTheme.text32.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blueBg,
                                      ),
                            ),
                            TextSpan(
                              text: " ${LocaleKeys.currencyEthUnitLabel.tr()}",
                              style:
                                  Theme.of(context).textTheme.text20.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blueBg,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "72",
                            style: Theme.of(context).textTheme.text24.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.bannerIndicator,
                                ),
                          ),
                          TextSpan(
                            text: LocaleKeys.percentageLabel.tr(),
                            style: Theme.of(context).textTheme.text16.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.bannerIndicator,
                                ),
                          ),
                        ])),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        trackShape: CustomTrackShape(),
                        overlayShape: SliderComponentShape.noOverlay),
                    child: Slider(
                      value: 80,
                      max: 100,
                      activeColor: AppColors.bannerIndicator,
                      inactiveColor: AppColors.backgroundBoxText,
                      onChanged: (double value) {},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "目標金額",
                              style:
                                  Theme.of(context).textTheme.text14.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.grey60,
                                      ),
                            ),
                            TextSpan(
                              text:
                                  " 4.000 ${LocaleKeys.currencyEthUnitLabel.tr()}",
                              style:
                                  Theme.of(context).textTheme.text12.copyWith(
                                        color: AppColors.grey60,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "あと少しで達成です!",
                        style: Theme.of(context).textTheme.text12.copyWith(
                              color: AppColors.almostDone,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  SpacingAlias.SizeHeight2,
                  TextStatus(
                    assistStatus: AssistStatus.Succeed,
                  ),
                  SpacingAlias.SizeHeight8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SpacingAlias.SizeWidth20,
                          IconText(
                            value: 24,
                            inactiveIcon: Icon(
                              Icons.favorite_outline,
                              size: 24,
                            ),
                            activeIcon: Icon(
                              Icons.favorite,
                              color: AppColors.iconSelected,
                              size: 24,
                            ),
                            isActive: true,
                          ),
                          SpacingAlias.SizeWidth32,
                          IconText(
                            value: 12,
                            inactiveIcon: Icon(
                              Icons.mode_comment_outlined,
                              color: AppColors.colorTextBase,
                              size: 24,
                            ),
                            activeIcon: Icon(
                              Icons.mode_comment_outlined,
                              size: 24,
                            ),
                          ),
                          SpacingAlias.SizeWidth32,
                          // TODO: Need change person icon
                          IconText(
                            value: 42,
                            inactiveIcon: Icon(
                              Icons.person_outline,
                              color: AppColors.colorTextBase,
                              size: 24,
                            ),
                            activeIcon: Icon(
                              Icons.person_outline,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          MaterialButton(
                            color: AppColors.blueBg,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 30,
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  "支援する",
                                  style: Theme.of(context)
                                      .textTheme
                                      .text14
                                      .copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                SpacingAlias.SizeWidth8,
                                badges.Badge(
                                  badgeStyle: badges.BadgeStyle(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 6,
                                        horizontal: 6,
                                      ),
                                      shape: badges.BadgeShape.circle,
                                      badgeColor: AppColors.white,
                                      elevation: 0),
                                  badgeContent: Text(
                                    "2",
                                    style: TextStyle(
                                      color: AppColors.blueBg,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  position: badges.BadgePosition.topStart(),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "2つの支援プラテンがあります",
                            style: Theme.of(context).textTheme.text8.copyWith(
                                  color: AppColors.blueBg,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SpacingAlias.SizeHeight16,
                  Container(
                    color: AppColors.box,
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Wrap(
                          children: [
                            CircularText(
                              size: 16,
                              text: "N",
                            ),
                            SpacingAlias.SizeWidth4,
                            Text(
                              "最近更新された活動状況があります",
                              style: Theme.of(context).textTheme.text10,
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: AppColors.colorGreyIcon,
                        )
                      ],
                    ),
                  ),
                  SpacingAlias.SizeHeight32,
                  Text(
                    "プロジェクトの説明",
                    style: Theme.of(context).textTheme.text16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SpacingAlias.SizeHeight12,
                  Text(
                    "● 世界で類をみない! VR (仮想世界での作品) × R(実作\n"
                    "品)の融合された大規模書道展 !\n"
                    "● 世代・国籍・言語を問わない文字がわからなくても楽\n"
                    "しめる書の新たな表現!\n"
                    "● 枠組みや固定観念を取り払う演出! 場が作品であり、\n"
                    "作品の一部として自分が存在する!",
                    style: Theme.of(context)
                        .textTheme
                        .text14
                        .copyWith(height: 1.6),
                  ),
                  SpacingAlias.SizeHeight16,
                  YoutubePlayer(
                    controller: _controller.value,
                    aspectRatio: 16 / 9,
                  ),
                  SpacingAlias.SizeHeight16,
                  Text(
                    "書道×VRの大規模アート書道展",
                    style: Theme.of(context).textTheme.text16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SpacingAlias.SizeHeight8,
                  Text(
                    "世界で類をみない! VR (仮想世界での作品) × R (実作\n"
                    "品)の大規模アート書道展! 書道を 「VR (仮想世界での作\n"
                    "品)」と「R(実作品) 」 で表現する、 世界で類をみない\n"
                    "前衛アート書道の展示イベントを開催します。\n"
                    "作品に潜るという体験",
                    style: Theme.of(context)
                        .textTheme
                        .text14
                        .copyWith(height: 1.6),
                  ),
                  SpacingAlias.SizeHeight16,
                  Text(
                    "書道×VRの大規模アート書道展",
                    style: Theme.of(context).textTheme.text16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SpacingAlias.SizeHeight8,
                  Text(
                    "制作の様子を20秒程度の動画にしております。 イメージす\n"
                    "るのが難しいとおもいますのでぜひ一度目を通していただ\n"
                    "けますと幸いです。",
                    style: Theme.of(context)
                        .textTheme
                        .text14
                        .copyWith(height: 1.6),
                  ),
                  SpacingAlias.SizeHeight16,
                  CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => Container(
                      height: 240,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    imageUrl:
                        "https://images7.alphacoders.com/401/thumb-1920-401390.png",
                  ),
                  SpacingAlias.SizeHeight16,
                  Text(
                    "企画者の想い",
                    style: Theme.of(context).textTheme.text16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SpacingAlias.SizeHeight8,
                  Text(
                    "企画者の前衛書道家岩坂典子と申します。 私は、3歳の時"
                    "から「書」の道を歩み、 現在は「前衛書道家」として活動"
                    "をしています。\n"
                    "26歳の時に10万人に1人の難病を発病し、 現在薬を使わず"
                    "社会生活を送っている奇跡的な状況を通し、 若い頃から死"
                    "を身近に感じています。 死ぬことを見つめることにより生"
                    "きることを考える。 その中で何を感じ、 何を伝えるか。"
                    "自分の人生において、 一書道家として文字を書く中、既存"
                    "の書道の限界を感じるようになりました。 それは、「文"
                    "「字」による限界です。 漢字・仮名がわからない人には楽し"
                    "めてもらえない、 例えば ｢心｣ という感じを見れば、 漢字"
                    "圏の人たちや文字から情感や想いを考えることができま"
                    "す。 わからなければ、文字の持つ感覚がストレートに伝わ"
                    "らない。 書が映し出す世界を共有することが難しいので"
                    "す。\n"
                    "文字の美しさに加え、 「書」 には日本文化特有の空間の美"
                    "があります。 多くの人が書道の持つ世界観や筆線の美しさ"
                    "等を感じてもらえれば。 したらもっとこの美しさを知って"
                    "もらえるのだろう。\n"
                    "こうして私の挑戦は始まりました。",
                    style: Theme.of(context)
                        .textTheme
                        .text14
                        .copyWith(height: 1.6),
                  ),
                  SpacingAlias.SizeHeight32,
                ],
              ),
            ),
            Container(
              color: AppColors.backgroundBoxText,
              width: ScreenUtil.deviceWidth,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${LocaleKeys.commentTabLabel.tr()} (3)",
                    style: Theme.of(context).textTheme.text16.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SpacingAlias.SizeHeight8,
                  CommentItem(
                    commentator: "1212312231",
                    imageUrl:
                        "https://images7.alphacoders.com/401/thumb-1920-401390.png",
                    commentTime: "9時間前",
                    comment: "天空美術館の3D映像で絵画の中に描かれた文字を観"
                        "たことはありますが､ 書道でどのように表現されて"
                        "いるのかとても楽しみです。",
                    replyCount: 1,
                  ),
                  SpacingAlias.SizeHeight8,
                  CommentItem(
                    commentator: "ゆみこ",
                    imageUrl:
                        "https://images7.alphacoders.com/401/thumb-1920-401390.png",
                    commentTime: "1日前",
                    comment: "VR書道ってどんなの?? と"
                        "今からわくわくしています"
                        "おつぼ",
                  ),
                  SpacingAlias.SizeHeight8,
                  CommentItem(
                    commentator: "おつぼ",
                    imageUrl:
                        "https://images7.alphacoders.com/401/thumb-1920-401390.png",
                    commentTime: "1週間以上前",
                    comment: "イベントの大成功お祈り致します!",
                  ),
                  SpacingAlias.SizeHeight6,
                  FlatButtonComponent(
                    color: AppColors.white,
                    textColor: Colors.blue,
                    elevation: 0,
                    title: LocaleKeys.seeMoreLabel.tr(),
                    onPressed: () {},
                  ),
                  SpacingAlias.SizeHeight24,
                ],
              ),
            ),
            Container(
              color: AppColors.backgroundSupportPlan,
              width: ScreenUtil.deviceWidth,
              padding: EdgeInsets.only(bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpacingAlias.SizeHeight16,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "${LocaleKeys.supportPlanLabel.tr()} (2)",
                      style: Theme.of(context).textTheme.text16.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  SpacingAlias.SizeHeight16,
                  SupportPlanItem(
                    title: "プレミアム・コーポレートサービス・サポーターズ権",
                    listUrlImageSlider: mockData,
                    bannerLeftValue: "残り8",
                    currency: 0.15,
                    peopleSupporting: 16,
                    limitTo: 50,
                  ),
                  SpacingAlias.SizeHeight32,
                  SupportPlanItem(
                    title: "プレミアム・コーポレートサービス・サポーターズ権",
                    listUrlImageSlider: mockData,
                    bannerLeftValue: "残り8",
                    currency: 0.15,
                    peopleSupporting: 16,
                    limitTo: 50,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: AppColors.white,
              width: ScreenUtil.deviceWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpacingAlias.SizeHeight16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ルミエーラー",
                        style: Theme.of(context).textTheme.text14.copyWith(
                            color: AppColors.greyDescription,
                            fontWeight: FontWeight.w600),
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(
                            Icons.bookmark_border,
                            color: Colors.blue,
                            size: 20,
                          ),
                          Text(
                            "フォローする",
                            style: Theme.of(context).textTheme.text14.copyWith(
                                  color: Colors.blue,
                                  height: 1,
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SpacingAlias.SizeHeight18,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AvatarCircular(
                        size: 84,
                        imageUrl:
                            "https://images7.alphacoders.com/401/thumb-1920-401390.png",
                      ),
                      SpacingAlias.SizeWidth16,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "前衛書道家",
                            style: Theme.of(context).textTheme.text14.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            "岩坂典子",
                            style: Theme.of(context).textTheme.text24.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SpacingAlias.SizeHeight4,
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: [
                              // TODO: Need change marker icon
                              Icon(
                                Icons.location_on_outlined,
                                size: 20,
                                color: Colors.indigo,
                              ),
                              Text(
                                "東京 日本",
                                style:
                                    Theme.of(context).textTheme.text14.copyWith(
                                          color: Colors.indigo,
                                          height: 1,
                                        ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SpacingAlias.SizeHeight20,
                  Text(
                    "こんにちは。 プロジェクト実行者の前衛家岩坂典子です。 "
                    "書道の中でも 非文字を得意とし、 日本 フランス モナコ等で活動をしています。 "
                    "書 道花道 茶道を嗜んでおり、 「道」 の日本文化は、 "
                    "敷居の高く安易に 踏み込めない世界感だと痛感しています。 "
                    "書道の筆線や空間美の素晴ら しさを感じてもらいたい思いで企画しました。 "
                    "デジタルが良い、 リアル が良い。 全てがよく素晴らしい。 "
                    "世の中にある全てのものが必要で良い ところを生かす為、 "
                    "アートを使って融合させる素晴らしさを全世代の 方々に伝えたい。 "
                    "私の想いから集まってくれたメンバーたちと、 プロ ジェクトを成功させ、 "
                    "新たなアートの可能性を探っていきたいと思いま す。",
                    style: Theme.of(context).textTheme.text14,
                  ),
                  SpacingAlias.SizeHeight20,
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.greyDescription,
                          width: 1,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Text(
                            LocaleKeys.recentlyUpdatedActivityStatusLabel.tr(),
                            style: Theme.of(context).textTheme.text12,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: AppColors.greyDescription,
                          )
                        ],
                      ),
                    ),
                  ),
                  SpacingAlias.SizeHeight24,
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.box,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.sameOriginatorProjectLabel.tr(),
                          style: Theme.of(context).textTheme.text16.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SpacingAlias.SizeHeight10,
                        Row(
                          children: [
                            OriginatorProjectItem(
                              title: "作られ置きごはん”を主人公にしたアニ"
                                  "メ製作プロジェクト。 共働き生活スト"
                                  "レスとフードロスの同時削減を実現し"
                                  "ます",
                              imageUrl:
                                  "https://images7.alphacoders.com/401/thumb-1920-401390.png",
                              dayLeftCount: 20,
                              currency: 2.456,
                              max: 100,
                              value: 65,
                            ),
                            SpacingAlias.SizeWidth16,
                            OriginatorProjectItem(
                              title: "NFTペンギンのオーナーになろう!"
                                  "ペンギンをNFT化し、 メタバース上で生"
                                  "態系シミュレーションする研究をしま"
                                  "す",
                              imageUrl:
                                  "https://images7.alphacoders.com/401/thumb-1920-401390.png",
                              dayLeftCount: 20,
                              currency: 170.02,
                              max: 100,
                              value: 465,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SpacingAlias.SizeHeight40,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
