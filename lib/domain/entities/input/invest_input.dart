import 'package:freezed_annotation/freezed_annotation.dart';

part 'invest_input.freezed.dart';
part 'invest_input.g.dart';

@freezed
class InvestInput with _$InvestInput {
  factory InvestInput({
    @Default('') String userToken,
    @Default('') String address,
    @Default('') String nftId,
  }) = _InvestInput;

  factory InvestInput.fromJson(Map<String, Object?> json) =>
      _$InvestInputFromJson(json);
}
