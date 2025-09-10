import 'package:auto_route/auto_route.dart';
import 'package:color_aap/src/screens/color_screen.dart';
import 'package:color_aap/src/screens_login/auth_screen.dart';
import 'package:color_aap/src/services/navigation.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          path: '/auth',
          initial: true,
        ),
        AutoRoute(
          page: ColorRoute.page,
          path: '/color/:email',
        ),
      ];
}

@RoutePage()
class AuthPage extends AuthScreen {}

@RoutePage()
class ColorPage extends ColorScreen {
  const ColorPage({required super.email, super.key});
}
