import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/reports/report.dart';

part 'report_response.freezed.dart';

@freezed
class ReportResponse with _$ReportResponse {
  factory ReportResponse({
    @Default(null) Report? result,
    @Default([]) List<String> errors,
    @Default(false) bool isSuccess,
  }) = _ReportResponse;
}
