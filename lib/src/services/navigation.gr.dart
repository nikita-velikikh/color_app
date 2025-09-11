// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:color_aap/src/services/navigation.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

abstract class $AppRouter extends _i2.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AuthPage(),
      );
    },
    ColorRoute.name: (routeData) {
      final args = routeData.argsAs<ColorRouteArgs>();
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ColorPage(
          email: args.email,
          key: args.key,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i2.PageRouteInfo<void> {
  const AuthRoute({List<_i2.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}

/// generated route for
/// [_i1.ColorPage]
class ColorRoute extends _i2.PageRouteInfo<ColorRouteArgs> {
  ColorRoute({
    required String email,
    _i3.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          ColorRoute.name,
          args: ColorRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ColorRoute';

  static const _i2.PageInfo<ColorRouteArgs> page =
      _i2.PageInfo<ColorRouteArgs>(name);
}

class ColorRouteArgs {
  const ColorRouteArgs({
    required this.email,
    this.key,
  });

  final String email;

  final _i3.Key? key;

  @override
  String toString() {
    return 'ColorRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i2.PageRouteInfo<void> {
  const SplashRoute({List<_i2.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
