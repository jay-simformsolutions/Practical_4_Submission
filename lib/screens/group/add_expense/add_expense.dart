import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../extensions/extensions.dart';
import '../../../store/group_store/add_expense_store.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_strings.dart';
import '../../../utils/theme_data.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.readProvider<AddExpenseStore>();

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
            onPressed: store.checkTextFormForValidation,
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
                Observer(
                  builder: (_) {
                    return GestureDetector(
                      onTap: store.getCategory,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: store.iconData == null
                              ? CommonColors.greyColor.shade200
                              : store.newColor,
                        ),
                        height: 50,
                        width: 50,
                        child: Icon(
                          store.iconData ?? Icons.note_alt_rounded,
                          color: CommonColors.whiteColor,
                          size: 40,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: store.descriptionController,
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
                Observer(
                  builder: (_) {
                    return GestureDetector(
                      onTap: store.showListOfCurrency,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: CommonColors.greyColor.shade200,
                        ),
                        height: 50,
                        width: 50,
                        child: Center(
                          child: store.currentSymbol == null
                              ? const Icon(Icons.currency_rupee_sharp)
                              : Text(
                                  store.currentSymbol!.symbol,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: CommonColors.blackColor,
                                  ),
                                ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: store.amountController,
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
                      ),
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
}
