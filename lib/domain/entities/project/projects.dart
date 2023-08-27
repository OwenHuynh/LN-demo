import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/pagination/pagination.dart';
import 'package:lnsp/domain/entities/project/project.dart';

part 'projects.freezed.dart';

@freezed
class Projects with _$Projects {
  factory Projects({
    @Default([]) List<Project> items,
    @Default(PaginationItem) PaginationItem pages,
  }) = _Projects;
}
