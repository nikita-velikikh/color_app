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

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  UserColors get colors => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call({UserColors colors, String email, String password});

  $UserColorsCopyWith<$Res> get colors;
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colors = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as UserColors,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserColorsCopyWith<$Res> get colors {
    return $UserColorsCopyWith<$Res>(_value.colors, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserColors colors, String email, String password});

  @override
  $UserColorsCopyWith<$Res> get colors;
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colors = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$UserDataImpl(
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as UserColors,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataImpl implements _UserData {
  const _$UserDataImpl(
      {required this.colors, required this.email, required this.password});

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  final UserColors colors;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'UserData(colors: $colors, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, colors, email, password);

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(
      this,
    );
  }
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {required final UserColors colors,
      required final String email,
      required final String password}) = _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  UserColors get colors;
  @override
  String get email;
  @override
  String get password;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UsersMap _$UsersMapFromJson(Map<String, dynamic> json) {
  return _UsersMap.fromJson(json);
}

/// @nodoc
mixin _$UsersMap {
  Map<String, UserData> get users => throw _privateConstructorUsedError;

  /// Serializes this UsersMap to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsersMap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsersMapCopyWith<UsersMap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersMapCopyWith<$Res> {
  factory $UsersMapCopyWith(UsersMap value, $Res Function(UsersMap) then) =
      _$UsersMapCopyWithImpl<$Res, UsersMap>;
  @useResult
  $Res call({Map<String, UserData> users});
}

/// @nodoc
class _$UsersMapCopyWithImpl<$Res, $Val extends UsersMap>
    implements $UsersMapCopyWith<$Res> {
  _$UsersMapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsersMap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Map<String, UserData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersMapImplCopyWith<$Res>
    implements $UsersMapCopyWith<$Res> {
  factory _$$UsersMapImplCopyWith(
          _$UsersMapImpl value, $Res Function(_$UsersMapImpl) then) =
      __$$UsersMapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, UserData> users});
}

/// @nodoc
class __$$UsersMapImplCopyWithImpl<$Res>
    extends _$UsersMapCopyWithImpl<$Res, _$UsersMapImpl>
    implements _$$UsersMapImplCopyWith<$Res> {
  __$$UsersMapImplCopyWithImpl(
      _$UsersMapImpl _value, $Res Function(_$UsersMapImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsersMap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_$UsersMapImpl(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as Map<String, UserData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersMapImpl implements _UsersMap {
  const _$UsersMapImpl({required final Map<String, UserData> users})
      : _users = users;

  factory _$UsersMapImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersMapImplFromJson(json);

  final Map<String, UserData> _users;
  @override
  Map<String, UserData> get users {
    if (_users is EqualUnmodifiableMapView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_users);
  }

  @override
  String toString() {
    return 'UsersMap(users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersMapImpl &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  /// Create a copy of UsersMap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersMapImplCopyWith<_$UsersMapImpl> get copyWith =>
      __$$UsersMapImplCopyWithImpl<_$UsersMapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersMapImplToJson(
      this,
    );
  }
}

abstract class _UsersMap implements UsersMap {
  const factory _UsersMap({required final Map<String, UserData> users}) =
      _$UsersMapImpl;

  factory _UsersMap.fromJson(Map<String, dynamic> json) =
      _$UsersMapImpl.fromJson;

  @override
  Map<String, UserData> get users;

  /// Create a copy of UsersMap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersMapImplCopyWith<_$UsersMapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
