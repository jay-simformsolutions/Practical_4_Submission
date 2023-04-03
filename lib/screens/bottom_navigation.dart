import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:splitwise/common_methods/theme_data.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    _checkBiometric();
    _authenticate();
    super.initState();
  }

  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric = false;
  late List<BiometricType> _availableBiometric;
  String authorized = 'Not authorized';

  void showSnackBar(Widget content) {
    SnackBar snackBar = SnackBar(content: content);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  ///checking biometrics
  ///this function will check the sensors and will tell us
  /// if we can use them or not
  Future<bool> _checkBiometric() async {
    _canCheckBiometric = await auth.canCheckBiometrics;
    return _canCheckBiometric;
  }

  ///this function will open an authentication dialog
  /// and it will check if we are authenticated or not
  /// so we will add the major action here like moving to another activity
  /// or just display a text that will tell us that we are authenticated
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
          localizedReason: CommonStrings.scanYourFinger,
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: false,
          ));
    } on PlatformException catch (e) {
      showSnackBar(const Text("Not Eligible for Bio-Metrics"));
    }
    if (!mounted) return;

    setState(() {
      authorized = authenticated
          ? CommonStrings.successAuthenticate
          : CommonStrings.failedAuthenticate;
    });
    if (authorized == CommonStrings.failedAuthenticate) {
      showExitPopup();
    }
  }

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

  void showExitPopup() {
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.white,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          CommonStrings.titleOfAuthenticate,
          style: themeData.textTheme.titleSmall!.copyWith(
            color: CommonColors.blackColor,
          ),
        ),
        content: const Text(CommonStrings.unlockSplitwise),
        actions: [
          SizedBox(
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CommonColors.whiteColor,
              ),
              onPressed: () => exit(0),
              child: Text(
                CommonStrings.cancelString,
                style: themeData.textTheme.bodySmall,
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _checkBiometric();
                _authenticate();
              },
              child: const Text(CommonStrings.unlockPlease),
            ),
          ),
        ],
      ),
    );
  }

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
