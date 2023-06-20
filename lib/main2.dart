import 'package:flutter/material.dart';

import 'routes/navigator_service.dart';
import 'routes/route_generator.dart';
import 'utils/theme_data.dart';

void main() => runApp(
      const HomePage(),
    );

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Main2 is run');
    return MaterialApp(
      theme: themeData,
      navigatorKey: NavigationService.instance.navigationKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
