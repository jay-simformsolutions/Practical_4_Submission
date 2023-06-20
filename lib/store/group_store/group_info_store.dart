import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:splitwise/model/group_info_model.dart';
import 'package:splitwise/routes/navigator_service.dart';
import 'package:splitwise/services/repository.dart';
import 'package:splitwise/utils/common_strings.dart';

import '../../enum/enum.dart';

part 'group_info_store.g.dart';

class GroupInfoStore = _GroupInfoStore with _$GroupInfoStore;

abstract class _GroupInfoStore with Store {
  @observable
  String? errorMessage;

  @observable
  NetworkState networkState = NetworkState.initial;

  _GroupInfoStore() {
    getGroupDetails();
  }

  ObservableList<GroupInfoModel> groups = ObservableList.of([]);

  Future<void> getGroupDetails() async {
    networkState = NetworkState.loading;
    debugPrint('In loading State');
    final response = await Repository.instance.getMovieData();
    if (response.response != null) {
      groups.addAll(response.response!);
      networkState = NetworkState.success;
      debugPrint('In success State');
    } else {
      debugPrint('Exception Occur');
      errorMessage = response.errorInfo;
      networkState = NetworkState.failure;
    }
  }

  Future<void> showDeleteDialog(String id) async {
    showDialog(
      context: NavigationService.instance.context,
      builder: (_) {
        return AlertDialog(
          content: Text(CommonStrings.deleteGroup),
          actions: [
            ElevatedButton(
              onPressed: NavigationService.instance.goBack,
              child: Text(CommonStrings.noString),
            ),
            ElevatedButton(
              onPressed: () {
                NavigationService.instance.goBack();
                deleteGroup(id);
              },
              child: Text(CommonStrings.yesString),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteGroup(String id) async {
    debugPrint('Id is ${id}');
    await Repository.instance.deleteGroup(id);
  }
}
