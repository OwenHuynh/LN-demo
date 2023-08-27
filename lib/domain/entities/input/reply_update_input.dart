import 'package:freezed_annotation/freezed_annotation.dart';

part 'reply_update_input.freezed.dart';

@freezed
class ReplyUpdateInput with _$ReplyUpdateInput {
  const factory ReplyUpdateInput({
    @Default('') String userToken,
    @Default('') String messageId,
    @Default('') String replyId,
    @Default('') String text,
  }) = _ReplyUpdateInput;

  factory ReplyUpdateInput.fromJson(Map<String, Object?> json) =>
      _$ReplyUpdateInputFromJson(json);
}
