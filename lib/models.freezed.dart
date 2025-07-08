// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserColors _$UserColorsFromJson(Map<String, dynamic> json) {
  return _UserColors.fromJson(json);
}

/// @nodoc
mixin _$UserColors {
  @ColorConverter()
  Color get backgroundColor => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get appBarColor => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get textColor => throw _privateConstructorUsedError;

  /// Serializes this UserColors to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserColorsCopyWith<UserColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserColorsCopyWith<$Res> {
  factory $UserColorsCopyWith(
          UserColors value, $Res Function(UserColors) then) =
      _$UserColorsCopyWithImpl<$Res, UserColors>;
  @useResult
  $Res call(
      {@ColorConverter() Color backgroundColor,
      @ColorConverter() Color appBarColor,
      @ColorConverter() Color textColor});
}

/// @nodoc
class _$UserColorsCopyWithImpl<$Res, $Val extends UserColors>
    implements $UserColorsCopyWith<$Res> {
  _$UserColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
    Object? appBarColor = null,
    Object? textColor = null,
  }) {
    return _then(_value.copyWith(
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      appBarColor: null == appBarColor
          ? _value.appBarColor
          : appBarColor // ignore: cast_nullable_to_non_nullable
              as Color,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserColorsImplCopyWith<$Res>
    implements $UserColorsCopyWith<$Res> {
  factory _$$UserColorsImplCopyWith(
          _$UserColorsImpl value, $Res Function(_$UserColorsImpl) then) =
      __$$UserColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ColorConverter() Color backgroundColor,
      @ColorConverter() Color appBarColor,
      @ColorConverter() Color textColor});
}

/// @nodoc
class __$$UserColorsImplCopyWithImpl<$Res>
    extends _$UserColorsCopyWithImpl<$Res, _$UserColorsImpl>
    implements _$$UserColorsImplCopyWith<$Res> {
  __$$UserColorsImplCopyWithImpl(
      _$UserColorsImpl _value, $Res Function(_$UserColorsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
    Object? appBarColor = null,
    Object? textColor = null,
  }) {
    return _then(_$UserColorsImpl(
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      appBarColor: null == appBarColor
          ? _value.appBarColor
          : appBarColor // ignore: cast_nullable_to_non_nullable
              as Color,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserColorsImpl implements _UserColors {
  const _$UserColorsImpl(
      {@ColorConverter() required this.backgroundColor,
      @ColorConverter() required this.appBarColor,
      @ColorConverter() required this.textColor});

  factory _$UserColorsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserColorsImplFromJson(json);

  @override
  @ColorConverter()
  final Color backgroundColor;
  @override
  @ColorConverter()
  final Color appBarColor;
  @override
  @ColorConverter()
  final Color textColor;

  @override
  String toString() {
    return 'UserColors(backgroundColor: $backgroundColor, appBarColor: $appBarColor, textColor: $textColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserColorsImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.appBarColor, appBarColor) ||
                other.appBarColor == appBarColor) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, backgroundColor, appBarColor, textColor);

  /// Create a copy of UserColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserColorsImplCopyWith<_$UserColorsImpl> get copyWith =>
      __$$UserColorsImplCopyWithImpl<_$UserColorsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserColorsImplToJson(
      this,
    );
  }
}

abstract class _UserColors implements UserColors {
  const factory _UserColors(
      {@ColorConverter() required final Color backgroundColor,
      @ColorConverter() required final Color appBarColor,
      @ColorConverter() required final Color textColor}) = _$UserColorsImpl;

  factory _UserColors.fromJson(Map<String, dynamic> json) =
      _$UserColorsImpl.fromJson;

  @override
  @ColorConverter()
  Color get backgroundColor;
  @override
  @ColorConverter()
  Color get appBarColor;
  @override
  @ColorConverter()
  Color get textColor;

  /// Create a copy of UserColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserColorsImplCopyWith<_$UserColorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
