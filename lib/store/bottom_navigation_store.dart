import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:splitwise/extensions/extensions.dart';
import 'package:splitwise/store/friend_store/contact_service_store.dart';

import '../routes/navigator_service.dart';
import '../screens/activity/activity_page.dart';
import '../screens/friends/friends_page.dart';
import '../screens/group/group_page.dart';
import '../screens/profile/profile_page.dart';
import '../utils/colors.dart';
import '../utils/common_strings.dart';

part 'bottom_navigation_store.g.dart';

class BottomNavigationStore = _BottomNavigationStore
    with _$BottomNavigationStore;

abstract class _BottomNavigationStore with Store {
  @observable
  int pageIndex = 0;

  late final List<Widget> screens = [
    const GroupPage(),
    const FriendsPage().withProvider(ContactServiceStore()),
    const ActivityPage(),
    const ProfilePage(),
  ];

  void onItemTapped(value) {
    pageIndex = value;
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: NavigationService.instance.context,
          builder: (_) => AlertDialog(
            content: const Text(CommonStrings.exitAppTitle),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: CommonColors.tealColor,
                      ),
                      onPressed: NavigationService.instance.goBack,
                      child: Text(
                        CommonStrings.noString,
                        style: TextStyle(color: CommonColors.whiteColor),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: CommonColors.whiteColor,
                      ),
                      onPressed: () => exit(0),
                      child: Text(
                        CommonStrings.yesString,
                        style: TextStyle(color: CommonColors.tealColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ) ??
        false;
  }
}
