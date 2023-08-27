import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/image/image_urls.dart';

part 'image_urls_input.freezed.dart';

@freezed
class ImageUrlsInput with _$ImageUrlsInput {
  factory ImageUrlsInput({
    @Default([]) List<ImageUrls> result,
    @Default('') List<String> errors,
    @Default(false) bool isSuccess,
  }) = _ImageUrlsInput;
}
