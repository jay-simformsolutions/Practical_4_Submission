import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../extensions/extensions.dart';
import '../store/bottom_navigation_store.dart';
import '../utils/colors.dart';
import '../utils/common_strings.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.readProvider<BottomNavigationStore>();

    return WillPopScope(
      onWillPop: readStore.showExitPopup,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Observer(
          builder: (_) {
            return readStore.screens[readStore.pageIndex];
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: CommonColors.tealColor,
          unselectedItemColor: CommonColors.greyColor,
          currentIndex: readStore.pageIndex,
          onTap: readStore.onItemTapped,
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
