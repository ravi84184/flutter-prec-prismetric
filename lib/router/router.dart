import 'package:auto_route/auto_route.dart';
import 'package:flutter_pre_prismetic/feature/home/details_screen/details_screen.dart';
import 'package:flutter_pre_prismetic/feature/home/home_screen.dart';
import 'package:flutter_pre_prismetic/feature/home/map_screen/map_screen.dart';
import 'package:flutter_pre_prismetic/feature/landing_screen/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    RedirectRoute(path: '/', redirectTo: '/splash'),
    AutoRoute(page: SplashScreen, path: "/splash", initial: true),
    AutoRoute(
      page: HomeScreen,
      path: "/home",
    ),
    AutoRoute(
      page: DetailsScreen,
      path: "/details",
    ),
    AutoRoute(
      page: MapScreen,
      path: "/map-screen",
    ),

    // AutoRoute(page: BookDetailsPage),
  ],
)
class $AppRouter {}
