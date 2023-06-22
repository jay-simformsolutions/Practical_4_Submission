import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:splitwise/enum/enum.dart';
import 'package:splitwise/routes/navigator_service.dart';
import 'package:splitwise/services/repository.dart';

import '../../Routes/Routes.dart';
import '../../model/group_expense_model.dart';
import '../../utils/colors.dart';
import '../../utils/theme_data.dart';

part 'group_expense_store.g.dart';

class GroupExpenseStore = _GroupExpenseStore with _$GroupExpenseStore;

abstract class _GroupExpenseStore with Store {
  _GroupExpenseStore() {
    getGroupExpenseDetails();
    debugPrint('Group Expense state is $networkState');
  }

  ObservableList<GroupExpenseModel> groupExpense = ObservableList.of([]);

  @observable
  int selectedIndex = 0;

  @observable
  NetworkState networkState = NetworkState.initial;

  @observable
  String? errorMessage;

  void getGroupExpenseDetails() async {
    networkState = NetworkState.loading;
    debugPrint('In loading state');
    final response = await Repository.instance.getGroupExpenseData();
    if (response.response != null) {
      groupExpense.addAll(response.response!);
      networkState = NetworkState.success;
      debugPrint('In success state');
    } else {
      errorMessage = response.errorInfo;
      networkState = NetworkState.failure;
    }
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
              NavigationService.instance
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
