import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

@freezed
class PaginationItem with _$PaginationItem {
  factory PaginationItem({@Default(0) int totalCount}) = _PaginationItem;
}
