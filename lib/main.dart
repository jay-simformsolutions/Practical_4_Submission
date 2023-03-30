import 'package:flutter/material.dart';

import 'common_methods/theme_data.dart';
import 'routes/navigator_service.dart';
import 'routes/route_generator.dart';

void main() => runApp(
      const HomePage(),
    );

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      navigatorKey: NavigationService().navigationKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
