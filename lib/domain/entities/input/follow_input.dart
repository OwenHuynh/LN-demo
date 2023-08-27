import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_input.freezed.dart';
part 'follow_input.g.dart';

@freezed
class FollowInput with _$FollowInput {
  factory FollowInput({
    @Default('') String userToken,
    @Default('') String userId,
  }) = _FollowInput;
  factory FollowInput.fromJson(Map<String, Object?> json) =>
      _$FollowInputFromJson(json);
}
