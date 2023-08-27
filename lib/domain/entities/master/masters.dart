import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/master/master.dart';

part 'masters.freezed.dart';
part 'masters.g.dart';

@freezed
class Masters with _$Masters {
  factory Masters({
    @Default([]) List<Master> items,
  }) = _Masters;
  factory Masters.fromJson(Map<String, Object?> json) =>
      _$MastersFromJson(json);
}
