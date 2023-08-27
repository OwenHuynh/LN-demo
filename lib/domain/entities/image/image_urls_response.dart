import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/image/image_urls.dart';

part 'image_urls_response.freezed.dart';

@freezed
class ImageUrlsResponseModel with _$ImageUrlsResponseModel {
  factory ImageUrlsResponseModel({
    @Default(ImageUrls()) ImageUrls result,
    @Default([]) List<String> errors,
    @Default(false) bool isSuccess,
  }) = _ImageUrlsResponseModel;
}
