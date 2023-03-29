import 'package:app_settings/app_settings.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../CommonMethodClass/theme_data.dart';
import '../../Routes/navigator_service.dart';
import '../../Routes/routes.dart';
import '../../Utils/colors.dart';
import '../../Utils/common_strings.dart';

class AddNewFriend extends StatefulWidget {
  const AddNewFriend({Key? key}) : super(key: key);

  @override
  State<AddNewFriend> createState() => _AddNewFriendState();
}

class _AddNewFriendState extends State<AddNewFriend> {
  List<Contact> contacts = [];
  bool isLoading = true;

  @override
  void initState() {
    getContactPermission();
    super.initState();
  }

  void showDontAskPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(CommonStrings.whoopsString),
          ),
          content: Text(
            CommonStrings.showWarning,
            style: themeData.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () => NavigationService().goBack(),
              child: Text(
                CommonStrings.cancelString,
                style: themeData.textTheme.bodySmall,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                AppSettings.openAppSettings(callback: getContactPermission);
              },
              child: Text(
                CommonStrings.settingString,
                style: themeData.textTheme.bodySmall,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        );
      },
    );
  }

  void getContactPermission() async {
    if (await Permission.contacts.isGranted) {
      setState(() {
        fetchContacts();
      });
    } else {
      if (await Permission.contacts.request().isGranted) {
        fetchContacts();
      } else if (await Permission.contacts.isDenied) {
        showDontAskPermissionDialog();
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void fetchContacts() async {
    contacts = await ContactsService.getContacts();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: CommonStrings.textFormFieldOfAddNameEmail,
            hintStyle: themeData.textTheme.bodySmall!.copyWith(
              color: CommonColors.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: CommonColors.blackColor,
          ),
          onPressed: () => NavigationService().goBack(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () =>
                  NavigationService().navigateToScreen(Routes.addNewContact),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: CommonColors.tealColor.shade100,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.person_add,
                        size: 17,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Text(
                      CommonStrings.addNewContacts,
                      style: themeData.textTheme.bodySmall!.copyWith(
                        color: CommonColors.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              CommonStrings.addNewContactFromList,
              style: themeData.textTheme.bodySmall!.copyWith(
                color: CommonColors.blackColor,
              ),
            ),
            SizedBox(
              height: 698,
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : contacts.isEmpty
                      ? Center(
                          child: Text(
                            CommonStrings.noAnyContacts,
                            style: themeData.textTheme.titleMedium!.copyWith(
                              color: CommonColors.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const CircleAvatar(
                                radius: 18,
                                child: Icon(Icons.phone),
                              ),
                              title: Text(
                                contacts[index].givenName!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    themeData.textTheme.titleMedium!.copyWith(
                                  color: CommonColors.darkGrey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                contacts[index].phones![0].value!,
                                style: themeData.textTheme.bodySmall!.copyWith(
                                  color: CommonColors.lightGreyColor,
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SnackBar snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: CommonColors.whiteColor,
            content: Text(
              CommonStrings.atLeastOnePersonRequire,
              style: themeData.textTheme.bodySmall!.copyWith(
                color: CommonColors.blackColor,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            duration: const Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(
          Icons.arrow_forward,
          color: CommonColors.whiteColor,
        ),
      ),
    );
  }
}
