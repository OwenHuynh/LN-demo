import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_search_input.freezed.dart';
part 'follow_search_input.g.dart';

@freezed
class FollowSearchInput with _$FollowSearchInput {
  factory FollowSearchInput({
    @Default('') String userToken,
  }) = _FollowSearchInput;
  factory FollowSearchInput.fromJson(Map<String, Object?> json) =>
      _$FollowSearchInputFromJson(json);
}
