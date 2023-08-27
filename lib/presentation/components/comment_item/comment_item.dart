import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/avatar/avatar_square.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:lnsp/presentation/theme/styles.dart';

class CommentItem extends StatelessWidget {
  CommentItem({
    required this.commentator,
    required this.imageUrl,
    required this.commentTime,
    required this.comment,
    this.replyCount,
    this.onReply,
  });

  final String commentator;
  final String commentTime;
  final String comment;
  final String imageUrl;
  final int? replyCount;
  final VoidCallback? onReply;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: new BoxDecoration(
        color: AppColors.white,
        borderRadius: new BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarSquare(
            width: 36,
            height: 36,
            imageUrl: imageUrl,
          ),
          SpacingAlias.SizeWidth8,
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  commentator,
                  style: Theme.of(context).textTheme.text16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  commentTime,
                  style: Theme.of(context).textTheme.text14.copyWith(
                        color: AppColors.grey1,
                      ),
                ),
                SpacingAlias.SizeHeight4,
                Text(comment, style: Theme.of(context).textTheme.text14),
                SpacingAlias.SizeHeight4,
                if (replyCount != null && replyCount! > 0)
                  GestureDetector(
                    onTap: onReply,
                    child: Text(
                      "${replyCount} ${LocaleKeys.replyLabel.tr()}",
                      style: Theme.of(context).textTheme.text14.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
