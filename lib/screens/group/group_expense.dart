import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:splitwise/Routes/Routes.dart';

import '../../common_methods/theme_data.dart';
import '../../routes/navigation_functions.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';

class GroupExpenseWidget extends StatefulWidget {
  final Map groupInfo;

  const GroupExpenseWidget({
    Key? key,
    required this.groupInfo,
  }) : super(key: key);

  @override
  State<GroupExpenseWidget> createState() => _GroupExpenseWidgetState();
}

class _GroupExpenseWidgetState extends State<GroupExpenseWidget> {
  List _groupExpense = [];

  @override
  void initState() {
    getGroupExpenseDetails();
    super.initState();
  }

  void getGroupExpenseDetails() async {
    final String response =
        await rootBundle.loadString(CommonStrings.loadGroupExpenseJson);
    final data = await json.decode(response);
    setState(
      () {
        _groupExpense = data;
      },
    );
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
  int selectedIndex = 0;

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
            setState(() {
              selectedIndex = i;
              if (selectedIndex != 0) {
                Navigator.pushNamed(
                  context,
                  choiceChipPages[selectedIndex - 1],
                );
              }
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  @override
  Widget build(BuildContext context) {
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
              widget.groupInfo['groupName'],
              style: themeData.textTheme.bodySmall!
                  .copyWith(fontSize: 20, color: CommonColors.whiteColor),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: context.popFunction,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.groupInfo['groupImage'],
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
                    child: Wrap(
                      spacing: 5,
                      direction: Axis.horizontal,
                      children: choiceChips(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: _groupExpense.length,
                    itemBuilder: (context, index) {
                      DateTime dateTime =
                          DateTime.parse(_groupExpense[index]['Date']);
                      if (_groupExpense[index]['Category'] == 'Payment') {
                        // print(index);
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
                                    _groupExpense[index]['Description'],
                                    style:
                                        themeData.textTheme.bodySmall!.copyWith(
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
                                          color: CommonColors.greyColor,
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
                                          color: CommonColors.greyColor,
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
                                          _groupExpense[index]['Description'],
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          maxLines: 1,
                                          style: themeData.textTheme.bodySmall!
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
                                          _groupExpense[index]
                                                      ['Sahil Totala'] ==
                                                  0
                                              ? 'You are not involved'
                                              : 'You paid ₹ ${_groupExpense[index]['Cost']}',
                                          style: themeData.textTheme.bodySmall!
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
                                          _groupExpense[index]['Sahil Totala'] >
                                                  0
                                              ? 'you lent'
                                              : _groupExpense[index]
                                                          ['Sahil Totala'] <
                                                      0
                                                  ? 'you borrowed'
                                                  : ' not involved',
                                          style: themeData.textTheme.bodySmall!
                                              .copyWith(
                                            color: _groupExpense[index]
                                                        ['Sahil Totala'] >
                                                    0
                                                ? CommonColors.tealColor
                                                : _groupExpense[index]
                                                            ['Sahil Totala'] <
                                                        0
                                                    ? Colors.orangeAccent
                                                    : Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          _groupExpense[index]['Sahil Totala'] >
                                                  0
                                              ? '₹ ${_groupExpense[index]['Sahil Totala']}'
                                                  .toString()
                                              : _groupExpense[index]
                                                          ['Sahil Totala'] <
                                                      0
                                                  ? '₹ ${_groupExpense[index]['Sahil Totala'].toString().substring(1)}'
                                                  : '',
                                          style: themeData.textTheme.bodySmall!
                                              .copyWith(
                                            color: _groupExpense[index]
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
