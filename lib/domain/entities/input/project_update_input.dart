import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/input/image_input.dart';
import 'package:lnsp/domain/entities/input/nft_update_input.dart';

part 'project_update_input.freezed.dart';

@freezed
class ProjectUpdateInput with _$ProjectUpdateInput {
  factory ProjectUpdateInput({
    @Default('') String id,
    @Default('') String userToken,
    String? address,
    String? title,
    String? overview,
    int? categoryId,
    ImageInput? mainImage,
    @Default([]) List<ImageInput>? subImages,
    num? targetAmount,
    int? status,
    DateTime? deadline,
    int? network,
    @Default([]) List<NftUpdateInput> nfts,
    @Default([]) List<String>? tags,
  }) = _ProjectUpdateInput;
  factory ProjectUpdateInput.fromJson(Map<String, Object?> json) =>
      _$ProjectUpdateInputFromJson(json);
}
