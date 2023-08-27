import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_input.freezed.dart';
part 'message_input.g.dart';

@freezed
class MessageInput with _$MessageInput {
  factory MessageInput({
    @Default('') String id,
    @Default('') String userToken,
    @Default('') String text,
  }) = _MessageInput;

  factory MessageInput.fromJson(Map<String, Object?> json) =>
      _$MessageInputFromJson(json);
}
