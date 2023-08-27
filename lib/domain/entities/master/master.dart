import 'package:freezed_annotation/freezed_annotation.dart';

part 'master.freezed.dart';
part 'master.g.dart';

@freezed
class Master with _$Master {
  factory Master({
    @Default(0) int id,
    @Default('') String label,
  }) = _Master;

  factory Master.fromJson(Map<String, Object?> json) => _$MasterFromJson(json);
}
