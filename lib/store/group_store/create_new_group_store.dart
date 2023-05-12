import 'dart:core';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../dispose_interface/dispose.dart';
import '../../routes/navigation_functions.dart';
import '../../routes/navigator_service.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';
import '../../utils/theme_data.dart';

part 'create_new_group_store.g.dart';

class CreateNewGroupStore = _CreateNewGroupStore with _$CreateNewGroupStore;

abstract class _CreateNewGroupStore with Store implements DisposeController {
  TextEditingController groupNameEditingController = TextEditingController();

  @observable
  int selectedIndex = 0;

  final List<String> _choiceChipsList = ['Trip', 'Home', 'Couple', 'Other'];
  final List<Icon> _choiceChipIcon = [
    const Icon(Icons.flight_takeoff_outlined),
    const Icon(Icons.home),
    const Icon(Icons.favorite_border),
    const Icon(Icons.note_alt_rounded)
  ];

  final List<String> iconString = [
    'https://s3.amazonaws.com/splitwise/uploads/group/default_avatars/avatar-ruby2-house-200px.png',
    'https://s3.amazonaws.com/splitwise/uploads/user/default_avatars/avatar-blue22-50px.png',
    'https://s3.amazonaws.com/splitwise/uploads/group/default_avatars/v2021/avatar-nongroup-50px.png',
  ];

  List<Widget> choiceChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _choiceChipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 13, 0),
        child: ChoiceChip(
          labelPadding: const EdgeInsets.all(7),
          avatar: _choiceChipIcon[i],
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            side: BorderSide(
              color: selectedIndex == i
                  ? CommonColors.tealColor
                  : CommonColors.whiteColor,
            ),
          ),
          label: Text(
            _choiceChipsList[i],
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
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  void completeOrShowDialogue() {
    if (groupNameEditingController.text.isEmpty) {
      showWarning();
    } else {
      NavigationService.instance.goBack();
    }
  }

  void showWarning() {
    showDialog(
      context: NavigationService.instance.context,
      builder: (context) {
        return AlertDialog(
          title: const Text(CommonStrings.errorString),
          content: Text(
            CommonStrings.enterGroupNameAlertDialog,
            style: themeData.textTheme.bodySmall!.copyWith(
              color: CommonColors.blackColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => context.popFunction(),
              child: const Text(CommonStrings.okString),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    debugPrint('Dispose is called and controller is dispose');
    groupNameEditingController.dispose();
  }
}
