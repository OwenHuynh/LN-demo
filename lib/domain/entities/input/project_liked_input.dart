import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_liked_input.freezed.dart';
part 'project_liked_input.g.dart';

@freezed
class ProjectLikedInput with _$ProjectLikedInput {
  factory ProjectLikedInput({
    @Default('') String userToken,
    @Default('') String projectId,
  }) = _ProjectLikedInput;

  factory ProjectLikedInput.fromJson(Map<String, Object?> json) =>
      _$ProjectLikedInputFromJson(json);
}
