import 'package:get_it/get_it.dart';

import '../api_provider.dart';

Future<void> configureDependencies() async {
  GetIt.I.registerSingletonAsync(
    () => APIProviderIml.getInstance(),
  );
}
