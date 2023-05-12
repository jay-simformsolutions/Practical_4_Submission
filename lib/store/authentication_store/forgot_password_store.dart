import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:splitwise/routes/navigator_service.dart';

import '../../utils/colors.dart';
import '../../utils/common_strings.dart';

part 'forgot_password_store.g.dart';

class ForgotPasswordStore = _ForgotPasswordStore with _$ForgotPasswordStore;

abstract class _ForgotPasswordStore with Store {
  final formKey = GlobalKey<FormState>();

  Future<dynamic> showAlertDialog() async {
    return showDialog(
      context: NavigationService.instance.context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            CommonStrings.alertDialogTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: Text(
            CommonStrings.confirmEmailString,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 15,
                ),
          ),
          actions: [
            ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      CommonColors.lightGreyColor,
                    ),
                  ),
              onPressed: NavigationService.instance.goBack,
              child: const Text(
                CommonStrings.okString,
              ),
            ),
            ElevatedButton(
              onPressed: NavigationService.instance.goBack,
              child: const Text(
                CommonStrings.cancelString,
              ),
            ),
          ],
        );
      },
    );
  }

  void conditionToShowAlertDialog() {
    if (formKey.currentState!.validate()) {
      showAlertDialog();
    }
  }
}
