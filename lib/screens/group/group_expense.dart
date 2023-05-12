import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../extensions/extensions.dart';
import '../../routes/navigator_service.dart';
import '../../store/group_store/group_expense_store.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';
import '../../utils/theme_data.dart';

class GroupExpenseWidget extends StatelessWidget {
  final Map groupInfo;

  const GroupExpenseWidget({
    Key? key,
    required this.groupInfo,
  }) : super(key: key);

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
              groupInfo['groupName'],
              style: themeData.textTheme.bodySmall!
                  .copyWith(fontSize: 20, color: CommonColors.whiteColor),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: NavigationService.instance.goBack,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                groupInfo['groupImage'],
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
                    return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: store.groupExpense.length,
                      itemBuilder: (_, index) {
                        DateTime dateTime =
                            DateTime.parse(store.groupExpense[index]['Date']);
                        if (store.groupExpense[index]['Category'] ==
                            'Payment') {
                          return SizedBox(
                            height: 60,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          DateFormat.MMM()
                                              .format(dateTime)
                                              .toString(),
                                          style: themeData.textTheme.bodySmall!
                                              .copyWith(
                                            fontSize: 15,
                                            color: CommonColors.greyColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          DateFormat('dd')
                                              .format(dateTime)
                                              .toString(),
                                          style: themeData.textTheme.bodySmall!
                                              .copyWith(
                                            color: CommonColors.greyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      Icons.money,
                                      color: CommonColors.tealColor,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      store.groupExpense[index]['Description'],
                                      style: themeData.textTheme.bodySmall!
                                          .copyWith(
                                        color: CommonColors.tealColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 100,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          DateFormat.MMM()
                                              .format(dateTime)
                                              .toString(),
                                          style: themeData.textTheme.bodySmall!
                                              .copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: CommonColors.tealColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          DateFormat('dd')
                                              .format(dateTime)
                                              .toString(),
                                          style: themeData.textTheme.bodySmall!
                                              .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: CommonColors.tealColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            store.groupExpense[index]
                                                ['Description'],
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                            maxLines: 1,
                                            style: themeData
                                                .textTheme.bodySmall!
                                                .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: CommonColors.whiteColor,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            store.groupExpense[index]
                                                        ['Sahil Totala'] ==
                                                    0
                                                ? 'You are not involved'
                                                : 'You paid ₹ ${store.groupExpense[index]['Cost']}',
                                            style: themeData
                                                .textTheme.bodySmall!
                                                .copyWith(
                                              color: CommonColors.greyColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            store.groupExpense[index]
                                                        ['Sahil Totala'] >
                                                    0
                                                ? 'you lent'
                                                : store.groupExpense[index]
                                                            ['Sahil Totala'] <
                                                        0
                                                    ? 'you borrowed'
                                                    : ' not involved',
                                            style: themeData
                                                .textTheme.bodySmall!
                                                .copyWith(
                                              color: store.groupExpense[index]
                                                          ['Sahil Totala'] >
                                                      0
                                                  ? CommonColors.tealColor
                                                  : store.groupExpense[index]
                                                              ['Sahil Totala'] <
                                                          0
                                                      ? Colors.orangeAccent
                                                      : Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            store.groupExpense[index]
                                                        ['Sahil Totala'] >
                                                    0
                                                ? '₹ ${store.groupExpense[index]['Sahil Totala']}'
                                                    .toString()
                                                : store.groupExpense[index]
                                                            ['Sahil Totala'] <
                                                        0
                                                    ? '₹ ${store.groupExpense[index]['Sahil Totala'].toString().substring(1)}'
                                                    : '',
                                            style: themeData
                                                .textTheme.bodySmall!
                                                .copyWith(
                                              color: store.groupExpense[index]
                                                          ['Sahil Totala'] >
                                                      0
                                                  ? CommonColors.tealColor
                                                  : Colors.orangeAccent,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                      },
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
