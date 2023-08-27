import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/input/image_input.dart';

part 'nft_update_input.freezed.dart';
part 'nft_update_input.g.dart';

@freezed
class NftUpdateInput with _$NftUpdateInput {
  const factory NftUpdateInput({
    String? id,
    String? address,
    String? title,
    String? symbol,
    String? overview,
    num? amountPerShare,
    int? minimumShare,
    ImageInput? image,
    bool? hasLimite,
    @Default([]) List<String>? attributes,
    num? maxSupply,
  }) = _NftUpdateInput;
  factory NftUpdateInput.fromJson(Map<String, Object?> json) =>
      _$NftUpdateInputFromJson(json);
}
