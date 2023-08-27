import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/image/image.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    @Default(0) int id,
    @Default('') String address,
    @Default('') String title,
    @Default('') String overview,
    @Default('') String quantity,
    @Default(0) int categoryId,
    @Default(Image()) Image mainImage,
    @Default(Image()) Image subImage,
    @Default(0) num targetAmount,
    @Default(0) int status,
    @Default('') String deadline,
    @Default('') String publishedDate,
    @Default(0) int network,
    @Default("") String tag,
    @Default('') String createDate,
    @Default('') String updateDate,
  }) = _Project;

  factory Project.fromJson(Map<String, Object?> json) =>
      _$ProjectFromJson(json);
}
