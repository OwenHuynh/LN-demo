import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/domain/entities/comment/comment_entity.dart';
import 'package:lnsp/presentation/components/comment_item/comment_item.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';

final kListCommentEntity = <CommentEntity>[
  CommentEntity(
    commentator: "hitofude",
    imageUrl: "https://images7.alphacoders.com/401/thumb-1920-401390.png",
    comment: "支援を検討しているのですが、もらえるNFT動画の再生時間はどれくらいになるのでしょうか??",
    commentTime: "9時間前",
    replyList: <CommentEntity>[
      CommentEntity(
          commentator: "hitofude",
          imageUrl: "https://images7.alphacoders.com/401/thumb-1920-401390.png",
          comment: "支援を検討しているのですが、もらえるNFT動画の再生時間はどれくらいになるのでしょうか??",
          commentTime: "9時間前",
          replyList: <CommentEntity>[])
    ],
  ),
  CommentEntity(
    commentator: "ゆみこ",
    imageUrl: "https://images7.alphacoders.com/401/thumb-1920-401390.png",
    comment: "VR書道ってどんなの? ? と今からわくわくしていますが次のVRチャットでの開催の予定はありますか?",
    commentTime: "1日前",
  ),
  CommentEntity(
    commentator: "おつぼ",
    imageUrl: "https://images7.alphacoders.com/401/thumb-1920-401390.png",
    comment: "イベントの大成功お祈り致します!",
    commentTime: "1週間以上前",
  ),
  CommentEntity(
    commentator: "hitofude",
    imageUrl: "https://images7.alphacoders.com/401/thumb-1920-401390.png",
    comment: "支援を検討しているのですが、もらえるNFT動画の再生時間はどれくらいになるのでしょうか??",
    commentTime: "9時間前",
    replyList: <CommentEntity>[
      CommentEntity(
          commentator: "hitofude",
          imageUrl: "https://images7.alphacoders.com/401/thumb-1920-401390.png",
          comment: "支援を検討しているのですが、もらえるNFT動画の再生時間はどれくらいになるのでしょうか??",
          commentTime: "9時間前",
          replyList: <CommentEntity>[])
    ],
  ),
  CommentEntity(
    commentator: "ゆみこ",
    imageUrl: "https://images7.alphacoders.com/401/thumb-1920-401390.png",
    comment: "VR書道ってどんなの? ? と今からわくわくしていますが次のVRチャットでの開催の予定はありますか?",
    commentTime: "1日前",
  ),
  CommentEntity(
    commentator: "おつぼ",
    imageUrl: "https://images7.alphacoders.com/401/thumb-1920-401390.png",
    comment: "イベントの大成功お祈り致します!",
    commentTime: "1週間以上前",
  ),
  CommentEntity(
    commentator: "hitofude",
    imageUrl: "https://images7.alphacoders.com/401/thumb-1920-401390.png",
    comment: "支援を検討しているのですが、もらえるNFT動画の再生時間はどれくらいになるのでしょうか??",
    commentTime: "9時間前",
    replyList: <CommentEntity>[
      CommentEntity(
          commentator: "hitofude",
          imageUrl: "https://images7.alphacoders.com/401/thumb-1920-401390.png",
          comment: "支援を検討しているのですが、もらえるNFT動画の再生時間はどれくらいになるのでしょうか??",
          commentTime: "9時間前",
          replyList: <CommentEntity>[])
    ],
  ),
  CommentEntity(
    commentator: "ゆみこ",
    imageUrl: "https://images7.alphacoders.com/401/thumb-1920-401390.png",
    comment: "VR書道ってどんなの? ? と今からわくわくしていますが次のVRチャットでの開催の予定はありますか?",
    commentTime: "1日前",
  ),
  CommentEntity(
    commentator: "おつぼ",
    imageUrl: "https://images7.alphacoders.com/401/thumb-1920-401390.png",
    comment: "イベントの大成功お祈り致します!",
    commentTime: "1週間以上前",
  ),
];

class CommentTab extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        color: AppColors.mainBackgroundDialog,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: AppColors.white,
                height: 10,
              ),
              SpacingAlias.SizeHeight32,
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 12),
                itemCount: kListCommentEntity.length,
                itemBuilder: (context, index) {
                  final item = kListCommentEntity[index];
                  return CommentItem(
                    commentator: item.commentator,
                    imageUrl: item.imageUrl,
                    commentTime: item.commentTime,
                    comment: item.comment,
                    replyCount: item.replyList.length,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SpacingAlias.SizeHeight10;
                },
              ),
              SpacingAlias.SizeHeight32,
            ],
          ),
        ),
      ),
    );
  }
}
