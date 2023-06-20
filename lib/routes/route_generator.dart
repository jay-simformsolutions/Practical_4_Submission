import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitwise/model/group_info.dart';
import 'package:splitwise/store/friend_store/add_new_contact_store.dart';
import 'package:splitwise/store/friend_store/contact_service_store.dart';
import 'package:splitwise/store/group_store/add_expense_store.dart';

import '../extensions/extensions.dart';
import '../screens/bio_metric_page.dart';
import '../screens/bottom_navigation.dart';
import '../screens/forgot_password.dart';
import '../screens/friends/add_new_contact.dart';
import '../screens/friends/add_new_friend.dart';
import '../screens/friends/friends_info.dart';
import '../screens/group/Group_Expense_Pages/group_balances.dart';
import '../screens/group/Group_Expense_Pages/group_settleup.dart';
import '../screens/group/Group_Expense_Pages/group_total_balance.dart';
import '../screens/group/add_expense/add_expense.dart';
import '../screens/group/add_expense/categories.dart';
import '../screens/group/create_new_group.dart';
import '../screens/group/group_expense.dart';
import '../screens/group/group_info.dart';
import '../screens/sign_in.dart';
import '../screens/sign_up.dart';
import '../store/authentication_store/forgot_password_store.dart';
import '../store/authentication_store/sign_in_store.dart';
import '../store/authentication_store/sign_up_store.dart';
import '../store/bio_metric_store/bio_metric_store.dart';
import '../store/bottom_navigation_store.dart';
import '../store/group_store/choice_chip_store.dart';
import '../store/group_store/create_new_group_store.dart';
import '../store/group_store/group_expense_store.dart';
import '../store/group_store/group_info_store.dart';
import '../utils/common_strings.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const BioMetricPage().withProvider(
            BioMetricStore(),
          ),
        );
      case Routes.bottomNavigationPage:
        return MaterialPageRoute(
          builder: (context) => const BottomNavigationBarWidget()
              .withProvider(BottomNavigationStore()),
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
      case Routes.createGroup:
        return MaterialPageRoute(
          builder: (_) =>
              const CreateGroup().withProvider(CreateNewGroupStore()),
        );
      case Routes.groupInfo:
        return MaterialPageRoute(
          builder: (_) => const GroupPageInfo().withMultiProvider(
            [
              Provider(
                create: (_) => GroupInfoStore(),
              ),
              Provider(
                create: (_) => CreateNewGroupStore(),
              ),
            ],
          ),
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
          builder: (_) => GroupExpenseWidget(groupInfo: args as GroupInfoModel)
              .withMultiProvider(
            [
              Provider(
                create: (_) => ChoiceChipListStore(),
              ),
              Provider(
                create: (_) => GroupExpenseStore(),
              ),
            ],
          ),
        );
      case Routes.categories:
        return MaterialPageRoute(
          builder: (_) => const CategoryList(),
        );
      case Routes.addFriend:
        return MaterialPageRoute(
          builder: (_) =>
              const AddNewFriend().withProvider(ContactServiceStore()),
        );
      case Routes.addNewContact:
        return MaterialPageRoute(
          builder: (_) =>
              const AddNewContactPage().withProvider(AddNewContactStore()),
        );
      case Routes.friendInfo:
        return MaterialPageRoute(
          builder: (_) => const FriendInformation(),
        );
      case Routes.addExpense:
        return MaterialPageRoute(
          builder: (_) => const AddExpense().withProvider(AddExpenseStore()),
        );

      default:
        return _errorPage();
    }
  }

  static Route<dynamic> _errorPage() {
    return MaterialPageRoute(
      builder: (_) {
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
