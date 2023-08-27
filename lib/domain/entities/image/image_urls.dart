import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/image/image_url.dart';

part 'image_urls.freezed.dart';

@freezed
class ImageUrls with _$ImageUrls {
  const factory ImageUrls({
    @Default([]) List<ImageUrl> items,
  }) = _ImageUrls;
}
