import 'package:freezed_annotation/freezed_annotation.dart';

part 'reply_input.freezed.dart';
part 'reply_input.g.dart';

@freezed
class ReplyInput with _$ReplyInput {
  const factory ReplyInput({
    @Default('') String userToken,
    @Default('') String messageId,
    @Default('') String text,
  }) = _ReplyInput;

  factory ReplyInput.fromJson(Map<String, Object?> json) =>
      _$ReplyInputFromJson(json);
}
