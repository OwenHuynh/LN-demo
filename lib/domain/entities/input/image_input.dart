import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_input.freezed.dart';
part 'image_input.g.dart';

@freezed
class ImageInput with _$ImageInput {
  const factory ImageInput({
    String? key,
    String? filename,
    String? path,
    String? contentType,
  }) = _ImageInput;

  factory ImageInput.fromJson(Map<String, Object?> json) =>
      _$ImageInputFromJson(json);
}
