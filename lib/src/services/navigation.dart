import 'package:auto_route/auto_route.dart';
import 'package:color_aap/src/screens/color_screen.dart';
import 'package:color_aap/src/screens/splash_screen.dart';
import 'package:color_aap/src/screens_login/auth_screen.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      path: '/splash',
      initial: true,
    ),
    AutoRoute(
      page: AuthRoute.page,
      path: '/auth',
    ),
    AutoRoute(
      page: ColorRoute.page,
      path: '/color',
    ),
  ];
}

@RoutePage()
class SplashPage extends SplashScreen {}

@RoutePage()
class AuthPage extends AuthScreen {}

@RoutePage()
class ColorPage extends ColorScreen {
  final String email;
  ColorPage({required this.email});
}