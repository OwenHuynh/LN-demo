import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_update_input.freezed.dart';

@freezed
class ReportUpdateInput with _$ReportUpdateInput {
  const factory ReportUpdateInput({
    @Default('') String id,
    @Default('') String userToken,
    @Default('') String projectId,
    String? title,
    String? overview,
    int? status,
  }) = _ReportUpdateInput;

  factory ReportUpdateInput.fromJson(Map<String, Object?> json) =>
      _$ReportUpdateInputFromJson(json);
}
