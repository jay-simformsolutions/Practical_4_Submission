import 'package:app_settings/app_settings.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../routes/navigator_service.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_strings.dart';
import '../../utils/theme_data.dart';

part 'contact_service_store.g.dart';

class ContactServiceStore = _ContactServiceStore with _$ContactServiceStore;

abstract class _ContactServiceStore with Store {
  _ContactServiceStore() {
    getContactPermission();
  }

  @observable
  List<Contact> contacts = [];

  ObservableList<Contact> selectedName = ObservableList.of([]);

  @observable
  Set<Contact> favouriteFriendList = {};

  @observable
  bool isLoading = true;

  @observable
  bool isShowContentOrButton = true;

  void showDontAskPermissionDialog() {
    showDialog(
      context: NavigationService.instance.context,
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

  void addConfirmFriendInList() {
    favouriteFriendList = {...favouriteFriendList, ...selectedName};
    selectedName.clear();
    debugPrint('Confirm Friend List is $favouriteFriendList');
    debugPrint(favouriteFriendList.length.toString());
  }

  void showConfirmFriendDialogToAddInList() {
    showDialog(
      context: NavigationService.instance.context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            CommonStrings.confirmMessageToAddInList,
            style: themeData.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: CommonColors.tealColor,
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
                popScreen();
                addConfirmFriendInList();
              },
              child: Text(
                CommonStrings.yesString,
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

  void showSnackBar() {
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
    ScaffoldMessenger.of(NavigationService.instance.context)
        .showSnackBar(snackBar);
  }

  void addToFriendList(int index) {
    selectedName.contains(contacts[index])
        ? selectedName.remove(contacts[index])
        : selectedName.add(contacts[index]);
  }

  void removeFromFriendList(int index) {
    debugPrint('Remove at index $index');
    selectedName.remove(selectedName[index]);
  }

  void getContactPermission() async {
    if (await Permission.contacts.isGranted) {
      fetchContacts();
    } else {
      if (await Permission.contacts.request().isGranted) {
        fetchContacts();
      } else if (await Permission.contacts.isDenied) {
        debugPrint(Permission.contacts.isGranted.toString());
        showDontAskPermissionDialog();
        isLoading = false;
      }
    }
  }

  void fetchContacts() async {
    contacts = await ContactsService.getContacts();
    isLoading = false;
  }

  void popScreen() {
    NavigationService.instance.goBack();
  }

  void navigateToScreen(String screen, {arguments}) {
    NavigationService.instance.navigateToScreen(screen, arguments: arguments);
  }
}
