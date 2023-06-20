import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:splitwise/model/group_info_model.dart';

import '../../extensions/extensions.dart';
import '../../routes/navigator_service.dart';
import '../../store/group_store/create_new_group_store.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';
import '../../utils/theme_data.dart';

class CreateGroup extends StatelessWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.readProvider<CreateNewGroupStore>();

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
          onPressed: NavigationService.instance.goBack,
        ),
        backgroundColor: CommonColors.whiteColor,
        actions: [
          IconButton(
            onPressed: () => store.addNewGroupData(
              GroupInfoModel(
                  name: store.groupNameEditingController.text,
                  groupImage: store
                      .iconString[Random().nextInt(store.iconString.length)],
                  createdAt: DateTime.now().timeZoneName),
            ),
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
                        controller: store.groupNameEditingController,
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
                child: Observer(
                  builder: (_) {
                    return Wrap(
                      spacing: 5,
                      direction: Axis.horizontal,
                      children: store.choiceChips(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
