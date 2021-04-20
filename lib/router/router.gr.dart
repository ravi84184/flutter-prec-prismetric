// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i7;

import '../app_import.dart' as _i6;
import '../feature/home/details_screen/details_screen.dart' as _i4;
import '../feature/home/home_screen.dart' as _i3;
import '../feature/home/map_screen/map_screen.dart' as _i5;
import '../feature/landing_screen/splash_screen.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.SplashScreen());
    },
    HomeRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i3.HomeScreen());
    },
    DetailsRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i4.DetailsScreen());
    },
    MapRoute.name: (entry) {
      var args = entry.routeData.argsAs<MapRouteArgs>();
      return _i1.MaterialPageX(
          entry: entry,
          child: _i5.MapScreen(
              key: args.key, latLng: args.latLng, text: args.text));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        _i1.RouteConfig(SplashRoute.name, path: '/splash'),
        _i1.RouteConfig(HomeRoute.name, path: '/home'),
        _i1.RouteConfig(DetailsRoute.name, path: '/details'),
        _i1.RouteConfig(MapRoute.name, path: '/map-screen')
      ];
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute() : super(name, path: '/splash');

  static const String name = 'SplashRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home');

  static const String name = 'HomeRoute';
}

class DetailsRoute extends _i1.PageRouteInfo {
  const DetailsRoute() : super(name, path: '/details');

  static const String name = 'DetailsRoute';
}

class MapRoute extends _i1.PageRouteInfo<MapRouteArgs> {
  MapRoute({_i6.Key? key, required _i7.LatLng latLng, required String text})
      : super(name,
            path: '/map-screen',
            args: MapRouteArgs(key: key, latLng: latLng, text: text));

  static const String name = 'MapRoute';
}

class MapRouteArgs {
  const MapRouteArgs({this.key, required this.latLng, required this.text});

  final _i6.Key? key;

  final _i7.LatLng latLng;

  final String text;
}
