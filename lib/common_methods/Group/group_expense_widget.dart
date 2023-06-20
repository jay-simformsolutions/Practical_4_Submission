import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:splitwise/store/group_store/group_expense_store.dart';
import 'package:splitwise/utils/common_strings.dart';

import '../../utils/colors.dart';
import '../../utils/theme_data.dart';

class ListOfGroupExpense extends StatelessWidget {
  const ListOfGroupExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.read<GroupExpenseStore>();
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      primary: false,
      itemCount: store.groupExpense.length,
      itemBuilder: (_, index) {
        DateTime dateTime = DateTime.parse(store.groupExpense[index].date!);
        if (store.groupExpense[index].category == 'Payment') {
          return SizedBox(
            height: 60,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          DateFormat.MMM().format(dateTime).toString(),
                          style: themeData.textTheme.bodySmall!.copyWith(
                            fontSize: 15,
                            color: CommonColors.greyColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          DateFormat('dd').format(dateTime).toString(),
                          style: themeData.textTheme.bodySmall!.copyWith(
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
                      store.groupExpense[index].description!,
                      style: themeData.textTheme.bodySmall!.copyWith(
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
                          DateFormat.MMM().format(dateTime).toString(),
                          style: themeData.textTheme.bodySmall!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: CommonColors.tealColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          DateFormat('dd').format(dateTime).toString(),
                          style: themeData.textTheme.bodySmall!.copyWith(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            store.groupExpense[index].description!,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            maxLines: 1,
                            style: themeData.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: CommonColors.whiteColor,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            store.groupExpense[index].userData == 0
                                ? CommonStrings.userNotInvolved
                                : 'You paid ₹ ${store.groupExpense[index].cost}',
                            style: themeData.textTheme.bodySmall!.copyWith(
                              color: CommonColors.greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            store.groupExpense[index].userData > 0
                                ? CommonStrings.lent
                                : store.groupExpense[index].userData < 0
                                    ? CommonStrings.borrowed
                                    : CommonStrings.notInvolved,
                            style: themeData.textTheme.bodySmall!.copyWith(
                              color: store.groupExpense[index].userData > 0
                                  ? CommonColors.tealColor
                                  : store.groupExpense[index].userData < 0
                                      ? Colors.orangeAccent
                                      : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            store.groupExpense[index].userData > 0
                                ? '₹ ${store.groupExpense[index].userData}'
                                    .toString()
                                : store.groupExpense[index].userData < 0
                                    ? '₹ ${store.groupExpense[index].userData.toString().substring(1)}'
                                    : '',
                            style: themeData.textTheme.bodySmall!.copyWith(
                              color: store.groupExpense[index].userData > 0
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
  }
}
