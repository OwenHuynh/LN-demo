import 'package:freezed_annotation/freezed_annotation.dart';

part 'command.freezed.dart';

@freezed
class Command with _$Command {
  factory Command(
      {@Default(0) int status,
      @Default('') String message}) = _Command;
}
