import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import '../../utils/common_strings.dart';

part 'group_services.g.dart';

class GroupServices = _GroupServices with _$GroupServices;

abstract class _GroupServices with Store {
  @observable
  List<dynamic> groups = [];

  @observable
  List<dynamic> groupExpense = [];

  @observable
  int selectedIndex = 0;

  Future<List<dynamic>> getGroupDetails() async {
    final String response =
        await rootBundle.loadString(CommonStrings.loadGroupJson);
    final data = await json.decode(response);
    groups = data['groups'];
    //debugPrint('Data is called from function with $groups');

    return groups;
  }

  Future<List<dynamic>> getGroupExpenseDetails() async {
    final String response =
        await rootBundle.loadString(CommonStrings.loadGroupExpenseJson);
    final data = await json.decode(response);
    groupExpense = data;

    return groupExpense;
  }
}
