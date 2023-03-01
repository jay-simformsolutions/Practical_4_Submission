import 'package:flutter/material.dart';
import 'package:splitwise/Screens/Friends/add_new_friend.dart';
import 'package:splitwise/Screens/Friends/friends_info.dart';
import 'package:splitwise/Screens/Group/create_new_group.dart';

import '../CommonMethodClass/theme_data.dart';
import '../Routes/routes.dart';
import 'Screens/bottom_navigation.dart';
import 'Screens/forgot_password.dart';
import 'Screens/landing_page.dart';
import 'Screens/sign_in.dart';
import 'Screens/sign_up.dart';
import 'Temp_Data_List/group_page.dart';

void main() => runApp(
      const HomePage(),
    );

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      initialRoute: Routes.bottomNavigationPage,
      routes: {
        Routes.bottomNavigationPage: (_) => const BottomNavigationBarWidget(),
        Routes.homePage: (_) => const LandingPage(),
        Routes.loginPage: (_) => const LoginPage(),
        Routes.signupPage: (_) => const SignUp(),
        Routes.forgotPassword: (_) => const ForgotPassword(),
        Routes.groupInfo: (_) => const GroupPageInfo(),
        Routes.createGroup: (_) => const CreateNewGroup(),
        Routes.addFriend: (_) => const AddNewFriend(),
        Routes.friendInfo: (_) => const FriendInformation(),
      },
    );
  }
}
