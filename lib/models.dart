import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

// Color converter for serialization
class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.value;
}

@freezed
class UserColors with _$UserColors {
  const factory UserColors({
    @ColorConverter() required Color backgroundColor,
    @ColorConverter() required Color appBarColor,
    @ColorConverter() required Color textColor,
  }) = _UserColors;

  factory UserColors.fromJson(Map<String, Object?> json) => _$UserColorsFromJson(json);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    required UserColors colors,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}

@freezed
class UsersMap with _$UsersMap {
  const factory UsersMap({
    required Map<String, UserData> users,
  }) = _UsersMap;

  factory UsersMap.fromJson(Map<String, dynamic> json) => _$UsersMapFromJson(json);
}
