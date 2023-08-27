import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_url_input.freezed.dart';
part 'image_url_input.g.dart';

@freezed
class ImageUrlInput with _$ImageUrlInput {
  factory ImageUrlInput({
    @Default('') String key,
    @Default('') String contentType,
  }) = _ImageUrlInput;

  factory ImageUrlInput.fromJson(Map<String, Object?> json) =>
      _$ImageUrlInputFromJson(json);
}
