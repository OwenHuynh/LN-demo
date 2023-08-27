import 'package:freezed_annotation/freezed_annotation.dart';

part 'span.freezed.dart';
part 'span.g.dart';

@freezed
class Span with _$Span {
  const factory Span({
    @Default('') String from,
    @Default('') String to,
  }) = _Span;

  factory Span.fromJson(Map<String, Object?> json) => _$SpanFromJson(json);
}
