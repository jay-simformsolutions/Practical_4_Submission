import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import '../../utils/common_strings.dart';

part 'group_info_store.g.dart';

class GroupInfoStore = _GroupInfoStore with _$GroupInfoStore;

abstract class _GroupInfoStore with Store {
  _GroupInfoStore() {
    getGroupDetails();
  }

  @observable
  List<dynamic> groups = [];

  Future<List> getGroupDetails() async {
    final String response =
        await rootBundle.loadString(CommonStrings.loadGroupJson);
    final data = await json.decode(response);
    groups = data['groups'];
    //debugPrint('Group is $groups');

    return groups;
  }
}
