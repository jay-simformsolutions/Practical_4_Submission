import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../extensions/extensions.dart';
import '../store/bottom_navigation_store.dart';
import '../utils/colors.dart';
import '../utils/common_strings.dart';

class BottomNavigationBarWidget extends StatelessObserverWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.readProvider<BottomNavigationStore>();

    return WillPopScope(
      onWillPop: store.showExitPopup,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: store.screens[store.pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: CommonColors.tealColor,
          unselectedItemColor: CommonColors.greyColor,
          type: BottomNavigationBarType.shifting,
          currentIndex: store.pageIndex,
          onTap: store.onItemTapped,
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
