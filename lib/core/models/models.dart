import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
  


part 'models.freezed.dart';
part 'models.g.dart';

/// Converts Color objects to/from JSON for serialization purposes
class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.toARGB32();
}


/// Data model representing user's color preferences for the app
@freezed
class UserColors with _$UserColors {
  const factory UserColors({
    @ColorConverter() required Color backgroundColor,
    @ColorConverter() required Color appBarColor,
    @ColorConverter() required Color textColor,
  }) = _UserColors;

  factory UserColors.fromJson(Map<String, Object?> json) =>
      _$UserColorsFromJson(json);
}



/// Data model representing user account information and preferences
@freezed
class UserData with _$UserData {
  const factory UserData({
    required UserColors colors,
    required String email,
    required String password,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}



/// Container model that holds a map of all users and their data
 @freezed
class UsersMap with _$UsersMap {
  const factory UsersMap({
    required Map<String, UserData> users,
  }) = _UsersMap;

  factory UsersMap.fromJson(Map<String, dynamic> json) =>
      _$UsersMapFromJson(json);
}
