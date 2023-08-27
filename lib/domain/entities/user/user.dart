import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/image/image.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    @Default('') String id,
    String? name,
    String? title,
    String? overview,
    @Default(Image()) Image icon,
  }) = _User;
}
