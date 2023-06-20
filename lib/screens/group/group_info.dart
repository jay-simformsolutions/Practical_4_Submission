import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:splitwise/common_methods/Group/group_info_widget.dart';
import 'package:splitwise/common_methods/error_widget.dart';
import 'package:splitwise/common_methods/manage_network_state.dart';
import 'package:splitwise/shimmer/shimmer_group_info.dart';

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
    final store = context.readProvider<GroupInfoStore>();

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
                NavigationService.instance.navigateToScreen(Routes.createGroup),
            icon: const Icon(Icons.group_add_outlined),
            color: CommonColors.blackColor,
          ),
        ],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: CommonColors.blackColor,
          onPressed: NavigationService.instance.goBack,
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
                return ManageNetworkState(
                  state: store.networkState,
                  shimmerWidget: GroupInfoShimmer(),
                  errorWidget: NetworkErrorWidget(
                    function: store.getGroupDetails,
                    text: store.errorMessage,
                  ),
                  successWidget: ListOfGroups(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
