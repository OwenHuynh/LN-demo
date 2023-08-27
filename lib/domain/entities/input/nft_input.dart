import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/input/image_input.dart';

part 'nft_input.freezed.dart';
part 'nft_input.g.dart';

@freezed
class NftInput with _$NftInput {
  const factory NftInput({
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
  }) = _NftInput;

  factory NftInput.fromJson(Map<String, Object?> json) =>
      _$NftInputFromJson(json);
}
