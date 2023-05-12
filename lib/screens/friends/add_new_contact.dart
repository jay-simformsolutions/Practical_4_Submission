import 'package:flutter/material.dart';
import 'package:splitwise/extensions/extensions.dart';

import '../../store/friend_store/add_new_contact_store.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';
import '../../utils/theme_data.dart';

class AddNewContactPage extends StatelessWidget {
  final String? text;
  final String? phoneNumber;

  const AddNewContactPage({Key? key, this.text, this.phoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.readProvider<AddNewContactStore>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CommonColors.whiteColor,
      appBar: AppBar(
        backgroundColor: CommonColors.whiteColor,
        centerTitle: false,
        title: Text(
          CommonStrings.addNewContacts,
          style: themeData.textTheme.bodySmall!.copyWith(
            color: CommonColors.blackColor,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: store.popScreen,
          icon: const Icon(
            Icons.arrow_back,
            color: CommonColors.blackColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: store.popScreen,
            icon: const Icon(
              Icons.done,
              color: CommonColors.blackColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              controller: store.textEditingController,
              cursorHeight: 20,
              style: const TextStyle(
                fontSize: 15,
                height: 25 / 26,
              ),
              cursorColor: CommonColors.tealColor,
              decoration: InputDecoration(
                label: Text(
                  CommonStrings.username,
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
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: store.phoneNumberController,
              cursorHeight: 20,
              style: const TextStyle(
                fontSize: 15,
                height: 25 / 26,
              ),
              cursorColor: CommonColors.tealColor,
              decoration: InputDecoration(
                label: Text(
                  CommonStrings.phoneOrEmail,
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
            const SizedBox(
              height: 10,
            ),
            Text(
              CommonStrings.nothingSend,
              style: themeData.textTheme.bodySmall!.copyWith(
                color: CommonColors.blackColor,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              CommonStrings.anotherChance,
              style: themeData.textTheme.bodySmall!.copyWith(
                color: CommonColors.blackColor,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
