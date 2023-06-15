import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../dispose_interface/dispose.dart';
import '../../routes/navigator_service.dart';

part 'add_new_contact_store.g.dart';

class AddNewContactStore = _AddNewContactStore with _$AddNewContactStore;

abstract class _AddNewContactStore with Store implements DisposeController {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  void popScreen() {
    NavigationService.instance.goBack();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    phoneNumberController.dispose();
  }
}
