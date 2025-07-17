// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserColorsImpl _$$UserColorsImplFromJson(Map<String, dynamic> json) =>
    _$UserColorsImpl(
      backgroundColor: const ColorConverter()
          .fromJson((json['backgroundColor'] as num).toInt()),
      appBarColor:
          const ColorConverter().fromJson((json['appBarColor'] as num).toInt()),
      textColor:
          const ColorConverter().fromJson((json['textColor'] as num).toInt()),
    );

Map<String, dynamic> _$$UserColorsImplToJson(_$UserColorsImpl instance) =>
    <String, dynamic>{
      'backgroundColor':
          const ColorConverter().toJson(instance.backgroundColor),
      'appBarColor': const ColorConverter().toJson(instance.appBarColor),
      'textColor': const ColorConverter().toJson(instance.textColor),
    };

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      colors: UserColors.fromJson(json['colors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'colors': instance.colors,
    };

_$UsersMapImpl _$$UsersMapImplFromJson(Map<String, dynamic> json) =>
    _$UsersMapImpl(
      users: (json['users'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, UserData.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$UsersMapImplToJson(_$UsersMapImpl instance) =>
    <String, dynamic>{
      'users': instance.users,
    };
