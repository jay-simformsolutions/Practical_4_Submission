import 'package:flutter/material.dart';

import '../CommonMethodClass/theme_data.dart';
import '../Routes/routes.dart';
import '../Screens/forgot_password.dart';
import '../Screens/landing_page.dart';
import '../Screens/sign_in.dart';
import 'Screens/sign_up.dart';

void main() => runApp(
      const HomePage(),
    );

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      initialRoute: Routes.homePage,
      routes: {
        Routes.homePage: (_) => const LandingPage(),
        Routes.loginPage: (_) => const LoginPage(),
        Routes.signupPage: (_) => const SignUp(),
        Routes.forgotPassword: (_) => const ForgotPassword(),
      },
    );
  }
}
