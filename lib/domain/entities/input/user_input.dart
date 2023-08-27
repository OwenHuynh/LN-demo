import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/input/image_input.dart';

part 'user_input.freezed.dart';
part 'user_input.g.dart';

@freezed
class UserInput with _$UserInput {
  const factory UserInput({
    @Default('') String userToken,
    String? name,
    String? title,
    String? overview,
    ImageInput? icon,
  }) = _UserInput;

  factory UserInput.fromJson(Map<String, Object?> json) =>
      _$UserInputFromJson(json);
}
