import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/user/user.dart';

part 'reply.freezed.dart';

@freezed
class Reply with _$Reply {
  factory Reply({
    @Default('') String id,
    @Default(User) User sender,
    @Default('') String text,
    @Default(DateTime) DateTime createDate,
    @Default(DateTime) DateTime updateDate,
  }) = _Reply;
}
