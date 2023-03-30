import 'package:flutter/material.dart';

import '../../common_methods/theme_data.dart';
import '../../routes/navigation_functions.dart';
import '../../routes/routes.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  TextEditingController textEditingController = TextEditingController();

  void completeOrShowDialogue() {
    if (textEditingController.text.isEmpty) {
      showWarning();
    } else {
      Navigator.pushNamed(context, Routes.groupInfo);
    }
  }

  void showWarning() {
    showDialog(
      context: context,
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

  final List _choiceChipsList = ['Trip', 'Home', 'Couple', 'Other'];
  final List _choiceChipIcon = [
    const Icon(Icons.flight_takeoff_outlined),
    const Icon(Icons.home),
    const Icon(Icons.favorite_border),
    const Icon(Icons.note_alt_rounded)
  ];
  int _selectedIndex = 0;

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
              color: _selectedIndex == i
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
          selected: _selectedIndex == i,
          selectedColor: CommonColors.tealColor.shade200,
          onSelected: (value) {
            setState(
              () {
                _selectedIndex = i;
              },
            );
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          CommonStrings.createNewGroup,
          style: themeData.textTheme.bodySmall!.copyWith(
            color: CommonColors.blackColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.cancel_outlined,
            color: CommonColors.blackColor,
          ),
          onPressed: context.popFunction,
        ),
        backgroundColor: CommonColors.whiteColor,
        actions: [
          IconButton(
            onPressed: completeOrShowDialogue,
            icon: const Icon(
              Icons.done,
              color: CommonColors.blackColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 75,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CommonColors.greyColor.shade200.withOpacity(0.5),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: CommonColors.blackColor,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: textEditingController,
                        cursorHeight: 20,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 25 / 26,
                        ),
                        cursorColor: CommonColors.tealColor,
                        decoration: InputDecoration(
                          label: Text(
                            CommonStrings.groupName,
                            style: themeData.textTheme.bodySmall!.copyWith(
                              color: CommonColors.blackColor,
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                CommonStrings.typeString,
                style: themeData.textTheme.bodySmall!.copyWith(
                  color: CommonColors.blackColor,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Wrap(
                  spacing: 5,
                  direction: Axis.horizontal,
                  children: choiceChips(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
