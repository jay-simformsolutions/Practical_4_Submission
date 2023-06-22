import 'package:flutter/material.dart';
import 'package:splitwise/Routes/Routes.dart';
import 'package:splitwise/enum/enviroment.dart';
import 'package:splitwise/flavor_config.dart';

import 'routes/navigator_service.dart';
import 'routes/route_generator.dart';
import 'utils/theme_data.dart';

void main() {
  FlavorConfig.init(flavor: Flavor.dev);
  runApp(
    const HomePage(),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Main Dev is run');
    return MaterialApp(
      theme: themeData,
      initialRoute: Routes.bioMetric,
      navigatorKey: NavigationService.instance.navigationKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
