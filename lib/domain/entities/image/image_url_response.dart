import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/image/image_url.dart';

part 'image_url_response.freezed.dart';

@freezed
class ImageUrlResponseModel with _$ImageUrlResponseModel {
  factory ImageUrlResponseModel({
    @Default(ImageUrl()) ImageUrl result,
    @Default([]) List<String> errors,
    @Default(false) bool isSuccess,
  }) = _ImageUrlResponseModel;
}
