import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:mobx/mobx.dart';
import 'package:splitwise/routes/navigator_service.dart';

import '../../Routes/Routes.dart';
import '../../dispose_interface/dispose.dart';
import '../../model/model_category_list.dart';
import '../../routes/navigation_functions.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';
import '../../utils/theme_data.dart';

part 'add_expense_store.g.dart';

class AddExpenseStore = _AddExpenseStore with _$AddExpenseStore;

abstract class _AddExpenseStore with Store implements DisposeController {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @observable
  String? iconName;

  @observable
  IconData? iconData;

  @observable
  Color? newColor;

  @observable
  Currency? currentSymbol;

  void getCategory() async {
    CategoryListModel value = await Navigator.pushNamed(
        NavigationService().context, Routes.categories) as CategoryListModel;

    iconName = value.iconName;
    iconData = value.iconData;
    newColor = value.color;
  }

  void showListOfCurrency() {
    showCurrencyPicker(
      context: NavigationService().context,
      showFlag: true,
      showCurrencyName: true,
      showCurrencyCode: true,
      onSelect: (Currency currency) {
        currentSymbol = currency;
      },
    );
  }

  void checkTextFormForValidation() {
    if (descriptionController.text.isEmpty && amountController.text.isEmpty) {
      showWarningForEnterValue();
    } else if (amountController.text.isEmpty) {
      showWarningForAmount();
    } else if (descriptionController.text.isEmpty) {
      showWarningForDescription();
    } else {
      NavigationService().goBack();
    }
  }

  void showWarningForDescription() {
    showDialog(
      context: NavigationService().context,
      builder: (parentContext) {
        return AlertDialog(
          title: Text(
            CommonStrings.canNotSaveExpense,
            style: themeData.textTheme.titleMedium!.copyWith(
              color: CommonColors.blackColor,
            ),
          ),
          content: Text(
            CommonStrings.warningDescription,
            style: themeData.textTheme.bodySmall!.copyWith(
              color: CommonColors.blackColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: parentContext.popFunction,
              child: const Text(CommonStrings.okString),
            ),
          ],
        );
      },
    );
  }

  void showWarningForAmount() {
    showDialog(
      context: NavigationService().context,
      builder: (parentContext) {
        return AlertDialog(
          title: Text(
            CommonStrings.canNotSaveExpense,
            style: themeData.textTheme.titleMedium!.copyWith(
              color: CommonColors.blackColor,
            ),
          ),
          content: Text(
            CommonStrings.warningAmount,
            style: themeData.textTheme.bodySmall!.copyWith(
              color: CommonColors.blackColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: parentContext.popFunction,
              child: const Text(CommonStrings.okString),
            ),
          ],
        );
      },
    );
  }

  void showWarningForEnterValue() {
    showDialog(
      context: NavigationService().context,
      builder: (parentContext) {
        return AlertDialog(
          title: Text(
            CommonStrings.canNotSaveExpense,
            style: themeData.textTheme.titleMedium!.copyWith(
              color: CommonColors.blackColor,
            ),
          ),
          content: Text(
            '${CommonStrings.warningDescription} \n ${CommonStrings.warningAmount}',
            style: themeData.textTheme.bodySmall!.copyWith(
              color: CommonColors.blackColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: parentContext.popFunction,
              child: const Text(CommonStrings.okString),
            ),
          ],
        );
      },
    );
  }

  @override
  dispose() {
    debugPrint('Dispose is called in store');
    descriptionController.dispose();
    amountController.dispose();
  }
}
