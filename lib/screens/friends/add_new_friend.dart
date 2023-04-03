import 'package:app_settings/app_settings.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../common_methods/theme_data.dart';
import '../../routes/navigator_service.dart';
import '../../routes/routes.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';

class AddNewFriend extends StatefulWidget {
  const AddNewFriend({Key? key}) : super(key: key);

  @override
  State<AddNewFriend> createState() => _AddNewFriendState();
}

class _AddNewFriendState extends State<AddNewFriend> {
  List<Contact> selectedName = [];
  List<Contact> contacts = [];
  bool isLoading = true;

  void popScreen() {
    NavigationService().goBack();
  }

  void navigateToScreen(String screen, {arguments}) {
    NavigationService().navigateToScreen(screen, arguments: arguments);
  }

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
              onTap: popScreen,
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

  void addToFriendList(int index) {
    setState(() {
      selectedName.contains(contacts[index])
          ? selectedName.remove(contacts[index])
          : selectedName.add(contacts[index]);
    });
  }

  void removeFromFriendList(int index) {
    setState(() {
      selectedName.remove(contacts[index]);
    });
  }

  void showSnackBar() {
    SnackBar snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: CommonColors.whiteColor,
      content: Text(
        CommonStrings.atLeastOnePersonRequire,
        style: themeData.textTheme.bodySmall!.copyWith(
          color: CommonColors.whiteColor,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.center,
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CommonColors.darkGrey,
      appBar: AppBar(
        backgroundColor: CommonColors.darkGrey,
        title: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: CommonStrings.textFormFieldOfAddNameEmail,
            hintStyle: themeData.textTheme.bodySmall!.copyWith(
              color: CommonColors.whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: CommonColors.whiteColor,
          ),
          onPressed: popScreen,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (selectedName.isNotEmpty)
              SizedBox(
                height: 80,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: selectedName.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 70,
                        width: 70,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 10),
                          child: Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: CommonColors.tealColor,
                                child:
                                    Text(selectedName[index].displayName![0]),
                              ),
                              Positioned(
                                left: 25,
                                child: GestureDetector(
                                  onTap: () => removeFromFriendList(index),
                                  child: const Icon(
                                    Icons.cancel,
                                    size: 18,
                                    color: CommonColors.whiteColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            InkWell(
              onTap: () => navigateToScreen(Routes.addNewContact),
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
                        color: CommonColors.whiteColor,
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
                color: CommonColors.whiteColor,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width,
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : contacts.isEmpty
                      ? Center(
                          child: Text(
                            CommonStrings.noAnyContacts,
                            style: themeData.textTheme.titleMedium!.copyWith(
                              color: CommonColors.whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => addToFriendList(index),
                              child: ListTile(
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
                                    color: CommonColors.tealColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  contacts[index].phones![0].value!,
                                  style:
                                      themeData.textTheme.bodySmall!.copyWith(
                                    color: CommonColors.lightGreyColor,
                                  ),
                                ),
                                trailing: selectedName.contains(
                                  contacts[index],
                                )
                                    ? const Icon(Icons.done)
                                    : null,
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => selectedName.isEmpty
            ? showSnackBar()
            : navigateToScreen(
                Routes.verifyFriendsInfo,
                arguments: selectedName,
              ),
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(
          Icons.arrow_forward,
          color: CommonColors.whiteColor,
        ),
      ),
    );
  }
}
