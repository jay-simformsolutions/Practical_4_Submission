import 'package:flutter/material.dart';

import '../../CommonMethodClass/add_expense_button.dart';
import '../../CommonMethodClass/elevated_button_onboard.dart';
import '../../CommonMethodClass/theme_data.dart';
import '../../Routes/navigation_functions.dart';
import '../../Routes/routes.dart';
import '../../Utils/assets.dart';
import '../../Utils/colors.dart';
import '../../Utils/common_strings.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.pushFunction(Routes.createGroup),
            icon: const Icon(
              Icons.group_add_outlined,
              color: CommonColors.blackColor,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: CommonColors.whiteColor,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Divider(
                  thickness: 1,
                ),
                Text(
                  CommonStrings.welcomeGroup,
                  style: themeData.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: CommonColors.blackColor,
                  ),
                ),
                const Image(
                  image: AssetImage(AssetString.groupAsset),
                ),
                Column(
                  children: [
                    Text(
                      CommonStrings.groupNotification,
                      style: themeData.textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: CommonColors.blackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      CommonStrings.groupWillShowHere,
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
                  buttonName: CommonStrings.makenewGroup,
                  onPress: () => context.pushFunction(Routes.createGroup),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButtonOnBoard(
                  icon: const Icon(
                    Icons.info_rounded,
                    color: CommonColors.tealColor,
                  ),
                  buttonName: CommonStrings.showGroupInfo,
                  onPress: () => context.pushFunction(Routes.groupInfo),
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
