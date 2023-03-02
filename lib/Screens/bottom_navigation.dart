import 'package:flutter/material.dart';

import '../Utils/colors.dart';
import '../Utils/common_strings.dart';
import 'Activity/activity_page.dart';
import 'Friends/friends_page.dart';
import 'Group/group_page.dart';
import 'Profile/profile_page.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
