import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../extensions/extensions.dart';
import '../../routes/navigator_service.dart';
import '../../routes/routes.dart';
import '../../store/group_store/group_info_store.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';
import '../../utils/theme_data.dart';

class GroupPageInfo extends StatelessWidget {
  final String? groupName;
  const GroupPageInfo({Key? key, this.groupName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readStore = context.readProvider<GroupInfoStore>();

    return Scaffold(
      backgroundColor: CommonColors.whiteColor,
      appBar: AppBar(
        backgroundColor: CommonColors.whiteColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: CommonColors.blackColor,
          ),
          IconButton(
            onPressed: () =>
                NavigationService().navigateToScreen(Routes.createGroup),
            icon: const Icon(Icons.group_add_outlined),
            color: CommonColors.blackColor,
          ),
        ],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: CommonColors.blackColor,
          onPressed: NavigationService().goBack,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Divider(),
            Row(
              children: [
                Text(
                  CommonStrings.youAllAreSet,
                  style: themeData.textTheme.bodySmall!.copyWith(
                    fontSize: 20,
                    color: CommonColors.blackColor,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.menu_open_rounded,
                  size: 30,
                  color: CommonColors.blackColor,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(
              builder: (_) {
                return readStore.groups.isEmpty
                    ? const CircularProgressIndicator()
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: readStore.groups.length,
                        itemBuilder: (_, index) {
                          return Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () =>
                                      NavigationService().navigateToScreen(
                                    Routes.groupExpense,
                                    arguments: {
                                      'index': index,
                                      'groupImage': readStore.groups[index]
                                          ['coverphoto'],
                                      'groupName': readStore.groups[index]
                                          ['name'],
                                    },
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 5, 0, 0),
                                        child: CircleAvatar(
                                          backgroundImage: readStore
                                              .groups[index]['coverphoto'],
                                          radius: 35,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        readStore.groups[index]['name']
                                            .toString(),
                                        style: themeData.textTheme.bodySmall!
                                            .copyWith(
                                          color: CommonColors.blackColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
