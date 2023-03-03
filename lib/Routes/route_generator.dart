import 'package:flutter/material.dart';

import '../Screens/Activity/activity_page.dart';
import '../Screens/Friends/add_new_friend.dart';
import '../Screens/Friends/friends_info.dart';
import '../Screens/Friends/friends_page.dart';
import '../Screens/Group/create_new_group.dart';
import '../Screens/Group/group_page.dart';
import '../Screens/Profile/profile_page.dart';
import '../Screens/bottom_navigation.dart';
import '../Temp_Data_List/group_page.dart';
import '../Utils/common_strings.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const BottomNavigationBarWidget(),
        );
      case '/groupPage':
        return MaterialPageRoute(
          builder: (_) => const GroupPage(),
        );
      case '/friendsPage':
        return MaterialPageRoute(
          builder: (_) => const FriendsPage(),
        );
      case '/activityPage':
        return MaterialPageRoute(
          builder: (_) => const ActivityPage(),
        );
      case '/profilePage':
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
        );
      case '/createGroup':
        return MaterialPageRoute(
          builder: (_) => const CreateGroup(),
        );
      case '/groupInfo':
        return MaterialPageRoute(
          builder: (_) => const GroupPageInfo(),
        );
      case '/addFriend':
        return MaterialPageRoute(
          builder: (_) => const AddNewFriend(),
        );
      case '/friendInfo':
        return MaterialPageRoute(
          builder: (_) => const FriendInformation(),
        );

      default:
        return _errorPage();
    }
  }

  static Route<dynamic> _errorPage() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(CommonStrings.errorString),
          ),
          body: const Center(
            child: Text(CommonStrings.pageNotFound),
          ),
        );
      },
    );
  }
}
