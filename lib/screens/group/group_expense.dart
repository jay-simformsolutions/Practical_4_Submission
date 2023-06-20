import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:splitwise/common_methods/Group/group_expense_widget.dart';
import 'package:splitwise/common_methods/error_widget.dart';
import 'package:splitwise/common_methods/manage_network_state.dart';
import 'package:splitwise/model/group_info_model.dart';
import 'package:splitwise/shimmer/shimmer_group_expense.dart';

import '../../extensions/extensions.dart';
import '../../routes/navigator_service.dart';
import '../../store/group_store/group_expense_store.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';
import '../../utils/theme_data.dart';

class GroupExpenseWidget extends StatelessWidget {
  const GroupExpenseWidget({
    Key? key,
    required this.groupInfo,
  }) : super(key: key);

  final GroupInfoModel groupInfo;

  @override
  Widget build(BuildContext context) {
    final store = context.readProvider<GroupExpenseStore>();

    return Scaffold(
      backgroundColor: CommonColors.darkGrey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: CommonColors.tealColor.shade400,
            floating: true,
            pinned: true,
            expandedHeight: 150,
            title: Text(
              groupInfo.name!,
              style: themeData.textTheme.bodySmall!
                  .copyWith(fontSize: 20, color: CommonColors.whiteColor),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: NavigationService.instance.goBack,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                groupInfo.groupImage!,
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 0, 0),
                  child: Text(
                    CommonStrings.allSettleUp,
                    style: themeData.textTheme.bodySmall!.copyWith(
                      color: CommonColors.whiteColor,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 2, 3, 4),
                    child: Observer(
                      builder: (_) {
                        return Wrap(
                          spacing: 5,
                          direction: Axis.horizontal,
                          children: store.choiceChips(),
                        );
                      },
                    ),
                  ),
                ),
                Observer(
                  builder: (_) {
                    return ManageNetworkState(
                      state: store.networkState,
                      shimmerWidget: GroupExpenseShimmer(),
                      successWidget: ListOfGroupExpense(),
                      errorWidget: NetworkErrorWidget(
                        text: store.errorMessage,
                        function: store.getGroupExpenseDetails,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
