import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/message/message.dart';

part 'report.freezed.dart';

@freezed
class Report with _$Report {
  factory Report({
    @Default('') String id,
    @Default('') String projectId,
    @Default('') String title,
    @Default('') String overview,
    @Default(0) int status,
    @Default(DateTime) DateTime createDate,
    @Default(DateTime) DateTime updateDate,
    @Default([]) List<Message> messages,
  }) = _Report;
}
