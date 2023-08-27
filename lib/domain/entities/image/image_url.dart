import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_url.freezed.dart';

@freezed
class ImageUrl with _$ImageUrl {
  const factory ImageUrl({
    @Default('') String key,
    @Default('') String url,
  }) = _ImageUrl;
}
