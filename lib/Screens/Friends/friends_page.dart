import 'package:flutter/material.dart';

import '../../CommonMethodClass/add_expense_button.dart';
import '../../CommonMethodClass/elevated_button_onboard.dart';
import '../../CommonMethodClass/theme_data.dart';
import '../../Routes/navigator_service.dart';
import '../../Routes/routes.dart';
import '../../Utils/assets.dart';
import '../../Utils/colors.dart';
import '../../Utils/common_strings.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.whiteColor,
      appBar: AppBar(
        backgroundColor: CommonColors.whiteColor,
        actions: [
          IconButton(
            onPressed: () =>
                NavigationService().navigateToScreen(Routes.addFriend),
            icon: const Icon(
              Icons.person_add_alt,
              color: CommonColors.blackColor,
            ),
          ),
        ],
        elevation: 1,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    CommonStrings.welcomeGroup,
                    style: themeData.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: CommonColors.blackColor,
                    ),
                  ),
                ),
                const Image(
                  image: AssetImage(AssetString.groupAsset),
                ),
                Column(
                  children: [
                    Text(
                      CommonStrings.friendNotification,
                      style: themeData.textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: CommonColors.blackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      CommonStrings.matesWillShow,
                      style: themeData.textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: CommonColors.blackColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButtonOnBoard(
                  icon: const Icon(
                    Icons.person_add,
                    color: CommonColors.tealColor,
                  ),
                  buttonName: CommonStrings.addMoreFriends,
                  onPress: () =>
                      NavigationService().navigateToScreen(Routes.addFriend),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButtonOnBoard(
                  icon: const Icon(
                    Icons.info_rounded,
                    color: CommonColors.tealColor,
                  ),
                  buttonName: CommonStrings.showFriendInfo,
                  onPress: () =>
                      NavigationService().navigateToScreen(Routes.friendInfo),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: BottomButton(),
          ),
        ],
      ),
    );
  }
}
