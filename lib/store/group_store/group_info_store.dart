import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:splitwise/model/group_info.dart';
import 'package:splitwise/services/repository.dart';

part 'group_info_store.g.dart';

class GroupInfoStore = _GroupInfoStore with _$GroupInfoStore;

abstract class _GroupInfoStore with Store {
  _GroupInfoStore() {
    getGroupDetails();
  }

  ObservableList<GroupInfoModel> groups = ObservableList.of([]);

  Future<void> getGroupDetails() async {
    final response = await Repository.instance.getMovieData();
    if (response.response!.isNotEmpty) {
      groups.addAll(response.response!);
    } else {
      debugPrint('Exception Occur');
    }
  }
}
