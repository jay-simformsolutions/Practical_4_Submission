import 'dart:io';

import 'package:flutter/material.dart';
import 'package:splitwise/routes/navigation_functions.dart';

import '../utils/colors.dart';
import '../utils/common_strings.dart';
import 'activity/activity_page.dart';
import 'friends/friends_page.dart';
import 'group/group_page.dart';
import 'profile/profile_page.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int selectedIndex = 0;

  void _onItemTapped(value) {
    setState(() {
      selectedIndex = value;
    });
  }

  final List<Widget> _screens = [
    const GroupPage(),
    const FriendsPage(),
    const ActivityPage(),
    const ProfilePage(),
  ];

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
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
                      onPressed: context.popFunction,
                      child: const Text(
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
                      child: const Text(
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: CommonColors.tealColor,
          unselectedItemColor: CommonColors.greyColor,
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: CommonStrings.groupBottomTitle,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined),
              label: CommonStrings.friendBottomTitle,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity),
              label: CommonStrings.activityBottomTitle,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: CommonStrings.profileBottomTitle,
            ),
          ],
        ),
      ),
    );
  }
}
