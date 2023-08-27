import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';
part 'image.g.dart';

@freezed
class Image with _$Image {
  const factory Image({
    @Default('') String key,
    @Default('') String fileName,
    @Default('') String path,
    @Default('') String contentType,
  }) = _Image;

  factory Image.fromJson(Map<String, Object?> json) => _$ImageFromJson(json);
}
