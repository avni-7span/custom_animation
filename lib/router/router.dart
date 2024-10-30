import 'package:auto_route/auto_route.dart';
import 'package:custom_animations/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        CustomRoute(
            page: BottomNavigationBarRoute.page,
            transitionsBuilder: TransitionsBuilders.slideBottom,
            children: [
              AutoRoute(page: HomeRoute.page),
              AutoRoute(page: ProfileRoute.page),
              AutoRoute(page: SettingsRoute.page),
            ]),
        // AutoRoute(page: DetailRoute.page),
        CustomRoute(
          page: DetailRoute.page,
          transitionsBuilder: TransitionsBuilders.slideTop,
        )
      ];

  @override
  List<AutoRouteGuard> get guards => [];
}
