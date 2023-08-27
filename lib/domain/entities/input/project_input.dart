import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/input/image_input.dart';
import 'package:lnsp/domain/entities/input/nft_input.dart';
part 'project_input.freezed.dart';
part 'project_input.g.dart';

@freezed
class ProjectInput with _$ProjectInput {
  const factory ProjectInput({
    @Default('') String userToken,
    @Default('') String address,
    @Default('') String title,
    @Default('') String overview,
    @Default(0) int categoryId,
    ImageInput? mainImage,
    List<ImageInput>? subImages,
    num? targetAmount,
    int? status,
    DateTime? deadline,
    int? network,
    @Default([]) List<NftInput> nfts,
    @Default([]) List<String>? tags,
  }) = _ProjectInput;

  factory ProjectInput.fromJson(Map<String, Object?> json) =>
      _$ProjectInputFromJson(json);
}
