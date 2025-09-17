import 'package:auto_route/auto_route.dart';
import 'package:color_aap/core/navigation/app_router.gr.dart';

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
