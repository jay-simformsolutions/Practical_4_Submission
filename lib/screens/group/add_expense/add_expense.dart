import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:splitwise/model/model_category_list.dart';
import 'package:splitwise/routes/routes.dart';

import '../../../common_methods/theme_data.dart';
import '../../../routes/navigation_functions.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_strings.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  Currency? currentSymbol;

  String? iconName;
  IconData? iconData;
  Color? newColor;

  void checkTextFormForValidation() {
    if (descriptionController.text.isEmpty && amountController.text.isEmpty) {
      showWarningForEnterValue();
    } else if (amountController.text.isEmpty) {
      showWarningForAmount();
    } else if (descriptionController.text.isEmpty) {
      showWarningForDescription();
    } else {
      context.popFunction();
    }
  }

  void getCategory() async {
    CategoryListModel value = await Navigator.of(context)
        .pushNamed(Routes.categories) as CategoryListModel;
    setState(() {
      iconName = value.iconName;
      iconData = value.iconData;
      newColor = value.color;
    });
  }

  void showListOfCurrency() {
    showCurrencyPicker(
      context: context,
      showFlag: true,
      showCurrencyName: true,
      showCurrencyCode: true,
      onSelect: (Currency currency) {
        setState(() {
          currentSymbol = currency;
        });
      },
    );
  }

  void showWarningForDescription() {
    showDialog(
      context: context,
      builder: (context) {
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
              onPressed: context.popFunction,
              child: const Text(CommonStrings.okString),
            ),
          ],
        );
      },
    );
  }

  void showWarningForAmount() {
    showDialog(
      context: context,
      builder: (context) {
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
              onPressed: context.popFunction,
              child: const Text(CommonStrings.okString),
            ),
          ],
        );
      },
    );
  }

  void showWarningForEnterValue() {
    showDialog(
      context: context,
      builder: (context) {
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
              onPressed: context.popFunction,
              child: const Text(CommonStrings.okString),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          CommonStrings.addExpense,
          style: themeData.textTheme.bodySmall!.copyWith(
            color: CommonColors.blackColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: CommonColors.blackColor,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: CommonColors.whiteColor,
        actions: [
          IconButton(
            onPressed: checkTextFormForValidation,
            icon: const Icon(
              Icons.done_outlined,
            ),
          ),
        ],
        elevation: 0.3,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              textBaseline: TextBaseline.ideographic,
              children: [
                Text(
                  CommonStrings.groupNameWithYou,
                  style: themeData.textTheme.bodySmall!.copyWith(
                    fontSize: 16,
                    color: CommonColors.blackColor,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 2.0, top: 5),
                    child: TextFormField(
                      style: themeData.textTheme.bodySmall!.copyWith(
                        color: CommonColors.blackColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: CommonStrings.textFormFieldOfAddNameEmail,
                        border: InputBorder.none,
                        hintStyle: themeData.textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          color: CommonColors.blackColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: getCategory,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: iconData == null
                          ? CommonColors.greyColor.shade200
                          : newColor,
                    ),
                    height: 50,
                    width: 50,
                    child: Icon(
                      iconData ?? Icons.note_alt_rounded,
                      color: CommonColors.whiteColor,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: descriptionController,
                    cursorHeight: 20,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 25 / 26,
                    ),
                    cursorColor: CommonColors.tealColor,
                    decoration: InputDecoration(
                      label: Text(
                        CommonStrings.labelOfDescription,
                        style: themeData.textTheme.bodySmall!.copyWith(
                          color: CommonColors.greyColor,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: CommonColors.tealColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: showListOfCurrency,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: CommonColors.greyColor.shade200,
                    ),
                    height: 50,
                    width: 50,
                    child: Center(
                      child: currentSymbol == null
                          ? const Icon(Icons.currency_rupee_sharp)
                          : Text(
                              currentSymbol!.symbol,
                              style: const TextStyle(
                                fontSize: 20,
                                color: CommonColors.blackColor,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    cursorHeight: 20,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 25 / 26,
                    ),
                    cursorColor: CommonColors.tealColor,
                    decoration: InputDecoration(
                      label: Text(
                        CommonStrings.labelOfAmount,
                        style: themeData.textTheme.bodySmall!.copyWith(
                          color: CommonColors.greyColor,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: CommonColors.tealColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  CommonStrings.paidBy,
                  style: themeData.textTheme.bodySmall!.copyWith(
                    color: CommonColors.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    color: CommonColors.whiteColor,
                    border:
                        Border.all(color: CommonColors.greyColor, width: 0.7),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      CommonStrings.you,
                      style: themeData.textTheme.bodySmall!.copyWith(
                        color: CommonColors.blackColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  CommonStrings.split,
                  style: themeData.textTheme.bodySmall!.copyWith(
                    color: CommonColors.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                    color: CommonColors.whiteColor,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: CommonColors.greyColor,
                      width: 0.7,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      CommonStrings.equally,
                      style: themeData.textTheme.bodySmall!.copyWith(
                        color: CommonColors.blackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    descriptionController.dispose();
    amountController.dispose();
    super.dispose();
  }
}
