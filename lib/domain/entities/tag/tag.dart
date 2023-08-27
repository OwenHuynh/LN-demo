import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';
@freezed
class Tag with _$Tag {
  const factory Tag({
    @Default(<String>[]) List<String> items,
  }) = _Tag; 
}