import 'package:flutter/material.dart';
import 'package:splitwise/Routes/routes.dart';
import 'package:splitwise/Screens/Group/group_expense.dart';

import '../Screens/Activity/activity_page.dart';
import '../Screens/Friends/add_new_friend.dart';
import '../Screens/Friends/friends_info.dart';
import '../Screens/Friends/friends_page.dart';
import '../Screens/Group/create_new_group.dart';
import '../Screens/Group/group_info.dart';
import '../Screens/Group/group_page.dart';
import '../Screens/Profile/profile_page.dart';
import '../Screens/bottom_navigation.dart';
import '../Utils/common_strings.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const BottomNavigationBarWidget(),
        );
      case Routes.groupPage:
        return MaterialPageRoute(
          builder: (_) => const GroupPage(),
        );
      case Routes.friendsPage:
        return MaterialPageRoute(
          builder: (_) => const FriendsPage(),
        );
      case Routes.activityPage:
        return MaterialPageRoute(
          builder: (_) => const ActivityPage(),
        );
      case Routes.profilePage:
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
        );
      case Routes.createGroup:
        return MaterialPageRoute(
          builder: (_) => const CreateGroup(),
        );
      case Routes.groupInfo:
        return MaterialPageRoute(
          builder: (_) => const GroupPageInfo(),
        );
      case Routes.groupExpense:
        return MaterialPageRoute(
          builder: (_) => GroupExpenseWidget(groupInfo: args as Map),
        );
      case Routes.addFriend:
        return MaterialPageRoute(
          builder: (_) => const AddNewFriend(),
        );
      case Routes.friendInfo:
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
