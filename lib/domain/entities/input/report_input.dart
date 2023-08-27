import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_input.freezed.dart';
part 'report_input.g.dart';

@freezed
class ReportInput with _$ReportInput {
  const factory ReportInput({
    @Default('') String userToken,
    @Default('') String projectId,
    String? title,
    String? overview,
    int? status,
  }) = _ReportInput;
  factory ReportInput.fromJson(Map<String, Object?> json) =>
      _$ReportInputFromJson(json);
}
