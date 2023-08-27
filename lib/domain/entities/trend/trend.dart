import 'package:freezed_annotation/freezed_annotation.dart';

part 'trend.freezed.dart';

@freezed
class TrendItem with _$TrendItem {
  factory TrendItem(
      {@Default('') String imageUrl,
      @Default('') String description,
      @Default(0) double percent,
      @Default(0) int dayLeft,
      @Default('') String quantity}) = _TrendItem;
}
