import 'package:auto_route/auto_route.dart';
import 'package:color_aap/core/navigation/navigation.gr.dart';

@AutoRouterConfig()
/// Navigation router for the app
class AppRouter extends $AppRouter {
  /// Constructor for AppRouter
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
