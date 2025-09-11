// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:color_aap/src/screens/color_screen.dart' as _i2;
import 'package:color_aap/src/screens/splash_screen.dart' as _i3;
import 'package:color_aap/src/screens_login/auth_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreen(),
      );
    },
    ColorRoute.name: (routeData) {
      final args = routeData.argsAs<ColorRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ColorScreen(
          email: args.email,
          key: args.key,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i4.PageRouteInfo<void> {
  const AuthRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ColorScreen]
class ColorRoute extends _i4.PageRouteInfo<ColorRouteArgs> {
  ColorRoute({
    required String email,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ColorRoute.name,
          args: ColorRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ColorRoute';

  static const _i4.PageInfo<ColorRouteArgs> page =
      _i4.PageInfo<ColorRouteArgs>(name);
}

class ColorRouteArgs {
  const ColorRouteArgs({
    required this.email,
    this.key,
  });

  final String email;

  final _i5.Key? key;

  @override
  String toString() {
    return 'ColorRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
