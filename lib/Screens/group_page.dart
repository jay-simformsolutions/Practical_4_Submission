import 'package:flutter/material.dart';
import 'package:splitwise/Routes/navigation_functions.dart';
import 'package:splitwise/Routes/routes.dart';
import 'package:splitwise/Utils/assets.dart';

import '../CommonMethodClass/add_expense_button.dart';
import '../CommonMethodClass/theme_data.dart';
import '../Utils/colors.dart';
import '../Utils/common_strings.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
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
                Container(
                  width: 220,
                  height: 40,
                  decoration: BoxDecoration(
                    color: CommonColors.whiteColor,
                    border: Border.all(
                      color: CommonColors.buttonBorderColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        flex: 4,
                        child: Icon(
                          Icons.person_add,
                          color: CommonColors.tealColor,
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                          child: Text(
                            CommonStrings.makenewGroup,
                            style: themeData.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: CommonColors.tealColor,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 220,
                  height: 40,
                  decoration: BoxDecoration(
                    color: CommonColors.whiteColor,
                    border: Border.all(
                      color: CommonColors.buttonBorderColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: InkWell(
                    onTap: () => context.pushFunction(Routes.groupInfoPage),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 4,
                          child: Icon(
                            Icons.info_rounded,
                            color: CommonColors.tealColor,
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                            child: Text(
                              CommonStrings.showGroupInfo,
                              style: themeData.textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: CommonColors.tealColor,
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
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
