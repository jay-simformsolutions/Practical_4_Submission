import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:splitwise/routes/navigator_service.dart';

import '../../Routes/Routes.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';
import '../../utils/theme_data.dart';

part 'group_expense_store.g.dart';

class GroupExpenseStore = _GroupExpenseStore with _$GroupExpenseStore;

abstract class _GroupExpenseStore with Store {
  _GroupExpenseStore() {
    getGroupExpenseDetails();
  }

  @observable
  List groupExpense = [];

  @observable
  int selectedIndex = 0;

  void getGroupExpenseDetails() async {
    final String response =
        await rootBundle.loadString(CommonStrings.loadGroupExpenseJson);
    final data = await json.decode(response);
    groupExpense = data;
  }

  static const List choiceChipPages = [
    Routes.groupSettleUp,
    Routes.groupBalances,
    Routes.groupTotalBalance,
  ];

  final List choiceChipsList = [
    'Group Expense',
    'Settle Up',
    'Balances',
    'Total',
  ];

  List<Widget> choiceChips() {
    List<Widget> chips = [];
    for (int i = 0; i < choiceChipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 13, 0),
        child: ChoiceChip(
          //labelPadding: const EdgeInsets.all(8),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            side: BorderSide(
              color: selectedIndex == i
                  ? CommonColors.tealColor
                  : CommonColors.whiteColor,
            ),
          ),
          label: Text(
            choiceChipsList[i],
            style: themeData.textTheme.bodySmall!.copyWith(
              color: CommonColors.blackColor,
            ),
          ),
          labelStyle: const TextStyle(
            color: CommonColors.whiteColor,
          ),
          backgroundColor: CommonColors.whiteColor,
          selected: selectedIndex == i,
          selectedColor: CommonColors.tealColor.shade200,
          onSelected: (value) {
            selectedIndex = i;
            if (selectedIndex != 0) {
              NavigationService()
                  .navigateToScreen(choiceChipPages[selectedIndex - 1]);
            }
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
