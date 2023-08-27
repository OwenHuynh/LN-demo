import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_input.freezed.dart';
part 'pagination_input.g.dart';

@freezed
class PaginationInput with _$PaginationInput {
  const factory PaginationInput({
    @Default(0) int take,
    @Default(0) int ship,
  }) = _PaginationInput;

  factory PaginationInput.fromJson(Map<String, Object?> json) =>
      _$PaginationInputFromJson(json);
}
