import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/master/masters.dart';

part 'master_response.freezed.dart';
part 'master_response.g.dart';

@freezed
class MasterResponse with _$MasterResponse {
  factory MasterResponse({
    @Default(0) Masters result,
    @Default('') List<String> errors,
    @Default(false) bool isSuccess,
  }) = _MasterResponse;

  factory MasterResponse.fromJson(Map<String, Object?> json) =>
      _$MasterResponseFromJson(json);
}
