import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_update_input.freezed.dart';
part 'message_update_input.g.dart';

@freezed
class MessageUpdateInput with _$MessageUpdateInput {
  factory MessageUpdateInput({
    @Default('') String id,
    @Default('') String userToken,
    @Default('') String text,
  }) = _MessageUpdateInput;

  factory MessageUpdateInput.fromJson(Map<String, Object?> json) =>
      _$MessageUpdateInputFromJson(json);
}
