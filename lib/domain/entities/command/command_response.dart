import 'package:freezed_annotation/freezed_annotation.dart';

part 'command_response.freezed.dart';

@freezed
class CommandResponse with _$CommandResponse {
  factory CommandResponse(
      {@Default(0) int status,
      @Default('') String message}) = _CommandResponse;
}
