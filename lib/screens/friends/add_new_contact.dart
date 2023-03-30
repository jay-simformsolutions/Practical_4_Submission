import 'package:flutter/material.dart';

import '../../common_methods/theme_data.dart';
import '../../routes/navigator_service.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';

class AddNewContactPage extends StatefulWidget {
  final String? text;
  final String? phoneNumber;

  const AddNewContactPage({Key? key, this.text, this.phoneNumber})
      : super(key: key);

  @override
  State<AddNewContactPage> createState() => _AddNewContactPageState();
}

class _AddNewContactPageState extends State<AddNewContactPage> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  void popScreen() {
    NavigationService().goBack();
  }

  @override
  Widget build(BuildContext context) {
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
          onPressed: popScreen,
          icon: const Icon(
            Icons.arrow_back,
            color: CommonColors.blackColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: popScreen,
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
              controller: textEditingController,
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
              controller: phoneNumberController,
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
