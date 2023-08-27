import "package:freezed_annotation/freezed_annotation.dart";

part "comment_entity.freezed.dart";
part 'comment_entity.g.dart';

@freezed
class CommentEntity with _$CommentEntity {
  factory CommentEntity({
    required String commentator,
    required String imageUrl,
    required String commentTime,
    required String comment,
    @Default([]) List<CommentEntity> replyList,
  }) = _CommentEntity;

  factory CommentEntity.fromJson(Map<String, Object?> json) =>
      _$CommentEntityFromJson(json);
}
