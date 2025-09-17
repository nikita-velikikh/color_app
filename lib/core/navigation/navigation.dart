import 'package:auto_route/auto_route.dart';
import 'package:color_aap/core/navigation/navigation.gr.dart';
import 'package:color_aap/core/widgets/splash_screen.dart';
import 'package:color_aap/features/auth/auth_screen.dart';
import 'package:color_aap/features/colors/color_screen.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          path: '/auth',
        ),
        AutoRoute(
          page: ColorRoute.page,
          path: '/color/:email',
        ),
        AutoRoute(
          page: SplashRoute.page,
          path: '/splash',
          initial: true,
        ),
      ];
}
