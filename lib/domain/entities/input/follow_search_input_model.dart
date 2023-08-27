import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_search_input_model.freezed.dart';

@freezed
class FollowSearchInputModel with _$FollowSearchInputModel {
  factory FollowSearchInputModel({
    @Default('') String userToken,
  }) = _FollowSearchInputModel;
}
