import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/tag/tag.dart';

part 'tags_response.freezed.dart';
@freezed
class TagsResponse with _$TagsResponse {
  const factory TagsResponse({
    Tag? result,
    @Default(<String>[]) List<String> errors,
    @Default(false) bool isSuccess
  }) = _TagsResponse;
}