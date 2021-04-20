import 'package:flutter/material.dart';
import 'package:flutter_pre_prismetic/router/router.gr.dart';
import 'package:flutter_pre_prismetic/utils/widget/app_gesture_detector.dart';

final appRouter = AppRouter();

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LandingPage();
  }
}

class LandingPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppGestureDetector(
        onTap: () {},
        child: MaterialApp.router(
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          /* theme: ThemeData(
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: AppColor.primary,
                  shape: RoundedRectangleBorder(),
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),*/
          builder: (_, router) {
            return router ?? Container();
          },
        ));
  }
}
