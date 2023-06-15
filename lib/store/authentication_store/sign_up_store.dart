import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../Routes/Routes.dart';
import '../../routes/navigator_service.dart';

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  final formKey = GlobalKey<FormState>();

  void clickForSignUp() {
    if (formKey.currentState!.validate()) {
      NavigationService.instance.goBack();
      NavigationService.instance.navigateToScreen(Routes.loginPage);
    }
  }
}
