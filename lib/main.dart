import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'feature/landing_screen/landing_screen.dart';
import 'services/flavor/flavor_config.dart';
import 'services/network/injection_dir/injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig.setUpFlavor();
  await di.configureDependencies();
  await GetIt.instance.allReady();

  runApp(LandingScreen());
}
