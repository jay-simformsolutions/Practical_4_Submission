import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:splitwise/routes/navigator_service.dart';
import 'package:splitwise/routes/routes.dart';

part 'sign_in_store.g.dart';

class SignInStore = _SignInStore with _$SignInStore;

abstract class _SignInStore with Store {
  @observable
  bool changeState = false;

  final formKey = GlobalKey<FormState>();

  pushAndRemoveSignUp() {
    NavigationService().popToFirst();
  }

  void clickForSignIn() {
    if (formKey.currentState!.validate()) {
      NavigationService().goBack();
      NavigationService().navigateToScreen(Routes.loginPage);
    }
  }

  void changedValue(bool? value) {
    changeState = !changeState;
  }
}
