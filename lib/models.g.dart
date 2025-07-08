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
