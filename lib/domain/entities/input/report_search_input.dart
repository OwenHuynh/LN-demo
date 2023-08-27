import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_search_input.freezed.dart';
part 'report_search_input.g.dart';

@freezed
class ReportSearchInput with _$ReportSearchInput {
  factory ReportSearchInput({
    @Default('') String projectId,
    int? statusId,
  }) = _ReportSearchInput;

  factory ReportSearchInput.fromJson(Map<String, Object?> json) =>
      _$ReportSearchInputFromJson(json);
}
