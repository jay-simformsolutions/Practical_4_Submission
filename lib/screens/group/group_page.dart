import 'package:flutter/material.dart';

import '../../common_methods/add_expense_button.dart';
import '../../common_methods/elevated_button_onboard.dart';
import '../../common_methods/theme_data.dart';
import '../../routes/routes.dart';
import '../../utils/assets.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.whiteColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Routes.createGroup),
            icon: const Icon(
              Icons.group_add_outlined,
              color: CommonColors.blackColor,
            ),
          ),
        ],
        elevation: 1,
        backgroundColor: CommonColors.whiteColor,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
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
                  onPress: () =>
                      Navigator.pushNamed(context, Routes.createGroup),
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
                  onPress: () => Navigator.pushNamed(context, Routes.groupInfo),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.addExpense),
              child: const BottomButton(),
            ),
          ),
        ],
      ),
    );
  }
}
