import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/message/message.dart';

part 'messages.freezed.dart';

@freezed
class Messages with _$Messages {
  const factory Messages({
    @Default([]) List<Message> items,
  }) = _Messages;
}
