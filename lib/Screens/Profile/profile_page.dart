import 'package:flutter/material.dart';

import '../../CommonMethodClass/list_tile.dart';
import '../../CommonMethodClass/theme_data.dart';
import '../../Utils/assets.dart';
import '../../Utils/colors.dart';
import '../../Utils/common_strings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 54, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    CommonStrings.accountHead,
                    style: themeData.textTheme.bodySmall!.copyWith(
                      color: CommonColors.blackColor,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        AssetString.profilePhoto,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          CommonStrings.name,
                          style: themeData.textTheme.bodySmall,
                        ),
                        Text(
                          CommonStrings.email,
                          style: themeData.textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                const ListTileWidget(
                  icon: Icon(Icons.qr_code),
                  menuName: CommonStrings.scanCode,
                ),
                const ListTileWidget(
                  icon: Icon(
                    Icons.diamond,
                    color: Colors.deepPurple,
                  ),
                  menuName: CommonStrings.splitWisePro,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    CommonStrings.preferences,
                    style: themeData.textTheme.bodySmall,
                  ),
                ),
                const ListTileWidget(
                  icon: Icon(
                    Icons.email,
                  ),
                  menuName: CommonStrings.emailSetting,
                ),
                const ListTileWidget(
                  icon: Icon(
                    Icons.notifications,
                  ),
                  menuName: CommonStrings.deviceAndPush,
                ),
                const ListTileWidget(
                  icon: Icon(
                    Icons.lock_rounded,
                  ),
                  menuName: CommonStrings.passcode,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    CommonStrings.feedback,
                    style: themeData.textTheme.bodySmall,
                  ),
                ),
                const ListTileWidget(
                  icon: Icon(
                    Icons.star_rate,
                  ),
                  menuName: CommonStrings.rateSplitwise,
                ),
                const ListTileWidget(
                  icon: Icon(
                    Icons.question_mark,
                  ),
                  menuName: CommonStrings.contact,
                ),
                const Divider(
                  thickness: 1,
                ),
                const ListTileWidget(
                  icon: Icon(
                    Icons.login,
                    color: CommonColors.tealColor,
                  ),
                  menuName: CommonStrings.logout,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  CommonStrings.copyright,
                  style: themeData.textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    color: CommonColors.blackColor,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      CommonStrings.ps,
                      style: themeData.textTheme.bodySmall!.copyWith(
                        fontSize: 12,
                        color: CommonColors.blackColor,
                      ),
                    ),
                    Text(
                      CommonStrings.bunnies,
                      style: themeData.textTheme.bodySmall!.copyWith(
                        fontSize: 10,
                        color: CommonColors.tealColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
