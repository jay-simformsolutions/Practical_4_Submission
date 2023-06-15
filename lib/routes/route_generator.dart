import 'package:flutter/material.dart';
import 'package:splitwise/extensions/extensions.dart';

import '../screens/activity/activity_page.dart';
import '../screens/bottom_navigation.dart';
import '../screens/forgot_password.dart';
import '../screens/friends/add_new_contact.dart';
import '../screens/friends/add_new_friend.dart';
import '../screens/friends/friends_info.dart';
import '../screens/friends/friends_page.dart';
import '../screens/group/Group_Expense_Pages/group_balances.dart';
import '../screens/group/Group_Expense_Pages/group_settleup.dart';
import '../screens/group/Group_Expense_Pages/group_total_balance.dart';
import '../screens/group/add_expense/add_expense.dart';
import '../screens/group/add_expense/categories.dart';
import '../screens/group/create_new_group.dart';
import '../screens/group/group_expense.dart';
import '../screens/group/group_info.dart';
import '../screens/group/group_page.dart';
import '../screens/profile/profile_page.dart';
import '../screens/sign_in.dart';
import '../screens/sign_up.dart';
import '../store/authentication_store/forgot_password_store.dart';
import '../store/authentication_store/sign_in_store.dart';
import '../store/authentication_store/sign_up_store.dart';
import '../utils/common_strings.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const BottomNavigationBarWidget(),
        );
      case Routes.signupPage:
        return MaterialPageRoute(
          builder: (_) => SignUp().withProvider(SignUpStore()),
        );
      case Routes.loginPage:
        return MaterialPageRoute(
          builder: (_) => LoginPage().withProvider(SignInStore()),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => ForgotPassword().withProvider(ForgotPasswordStore()),
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
      case Routes.groupSettleUp:
        return MaterialPageRoute(
          builder: (_) => const GroupSettleUp(),
        );
      case Routes.groupBalances:
        return MaterialPageRoute(
          builder: (_) => const GroupBalance(),
        );
      case Routes.groupTotalBalance:
        return MaterialPageRoute(
          builder: (_) => const TotalGroupExpense(),
        );
      case Routes.groupExpense:
        return MaterialPageRoute(
          builder: (_) => GroupExpenseWidget(groupInfo: args as Map),
        );
      case Routes.categories:
        return MaterialPageRoute(
          builder: (_) => const CategoryList(),
        );
      case Routes.addFriend:
        return MaterialPageRoute(
          builder: (_) => const AddNewFriend(),
        );
      case Routes.addNewContact:
        return MaterialPageRoute(
          builder: (_) => const AddNewContactPage(),
        );
      case Routes.friendInfo:
        return MaterialPageRoute(
          builder: (_) => const FriendInformation(),
        );
      case Routes.addExpense:
        return MaterialPageRoute(
          builder: (_) => const AddExpense(),
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
