import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lnsp/domain/entities/user/user_detail.dart';

part 'user_response.freezed.dart';

@freezed
class UserResponse with _$UserResponse {
  factory UserResponse(
      {@Default(0) int status,
      @Default('') String message,
      @Default(UserDetail) UserDetail result,      
      }) = _UserResponse;
}
