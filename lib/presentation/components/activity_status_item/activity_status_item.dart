import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:lnsp/presentation/theme/styles.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ActivityStatusItem extends HookConsumerWidget {
  const ActivityStatusItem({
    required this.title,
    required this.time,
    required this.imageUrl,
    required this.commentCount,
    required this.description,
    required this.commentCallBack,
    required this.videoId,
    this.isVideo = false,
  });

  final String title;
  final String imageUrl;
  final String description;
  final String time;
  final int commentCount;
  final bool isVideo;
  final VoidCallback commentCallBack;
  final String videoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = useRef(
      YoutubePlayerController.fromVideoId(
        videoId: videoId,
        autoPlay: false,
        params: const YoutubePlayerParams(showFullscreenButton: true),
      ),
    );
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            spreadRadius: 0,
            offset: Offset(0, 3), // shadow direction: bottom right
          )
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.text14.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            time,
            style: Theme.of(context).textTheme.text12.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey1,
                ),
          ),
          SpacingAlias.SizeHeight12,
          if (isVideo)
            YoutubePlayer(
              controller: _controller.value,
              aspectRatio: 16 / 9,
            )
          else
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
              imageUrl: imageUrl,
            ),
          SpacingAlias.SizeHeight18,
          Text(
            description,
            style: Theme.of(context).textTheme.text14,
          ),
          SpacingAlias.SizeHeight18,
          if (commentCount > 0)
            GestureDetector(
              onTap: commentCallBack,
              child: Container(
                alignment: Alignment.topRight,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Icon(
                      Icons.mode_comment_outlined,
                      color: AppColors.colorComment,
                      size: 24,
                    ),
                    SpacingAlias.SizeWidth4,
                    Text(
                      "${commentCount}${LocaleKeys.commentLabel.tr()}",
                      style: Theme.of(context).textTheme.text14.copyWith(
                            color: AppColors.colorComment,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            )
          else
            GestureDetector(
              onTap: commentCallBack,
              child: Container(
                alignment: Alignment.topRight,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.addCommentLabel.tr(),
                      style: Theme.of(context).textTheme.text14.copyWith(
                            color: AppColors.colorComment,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SpacingAlias.SizeWidth4,
                    Icon(
                      Icons.add,
                      color: AppColors.colorComment,
                      size: 24,
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
