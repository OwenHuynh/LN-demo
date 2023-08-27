import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/message/messages.dart';

part 'message_response.freezed.dart';

@freezed
class MessageResponse with _$MessageResponse {
  factory MessageResponse({
    @Default(Messages()) Messages result,
    @Default('') List<String> errors,
    @Default(false) bool isSuccess,
  }) = _MessageResponse;
}
