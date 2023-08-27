import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/input/image_input.dart';

part 'user_update_input.freezed.dart';
part 'user_update_input.g.dart';

@freezed
class UserUpdateInput with _$UserUpdateInput {
  const factory UserUpdateInput({
    @Default("") String userToken,
    String? name,
    String? title,
    String? overview,
    ImageInput? icon,
  }) = _UserUpdateInput;

  factory UserUpdateInput.fromJson(Map<String, Object?> json) =>
      _$UserUpdateInputFromJson(json);
}
