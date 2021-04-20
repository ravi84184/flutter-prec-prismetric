import 'package:flutter/material.dart';
import 'package:flutter_pre_prismetic/feature/home/widget/zoom_scaffold.dart';
import 'package:flutter_pre_prismetic/utils/widget/app_scaffold_wrapper.dart';
import 'package:provider/provider.dart';

import 'dashboard/dashboard_page.dart';
import 'widget/menu_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late MenuController menuController;

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context, child) => child!,
      create: (BuildContext context) => menuController,
      child: ZoomScaffold(
        menuScreen: MenuScreen(),
        contentScreen: Layout(
          contentBuilder: (cc) => AppScaffoldWrapper(
            child: Scaffold(
              body: DashboardPage(),
            ),
          ),
        ),
      ),
    );
    return AppScaffoldWrapper(
      child: Scaffold(
        body: DashboardPage(),
      ),
    );
  }
}
