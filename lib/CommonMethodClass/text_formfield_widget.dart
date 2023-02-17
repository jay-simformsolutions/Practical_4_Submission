import 'package:flutter/material.dart';

import '../Utils/colors.dart';
import '../Utils/common_strings.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final Icon icon;
  final bool isObsecure;

  TextFormFieldWidget({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.isObsecure,
  }) : super(key: key);

  String? checkForConfirmPassword;

  String? _emailVerification(String? email) {
    if (isEmailValid(email!)) {
      return null;
    } else {
      return CommonStrings.wrongEmailIdMessage;
    }
  }

  String? _passwordValidation(String? password) {
    if (password!.length < 8) {
      return CommonStrings.passwordIsNotBig;
    } else if (!RegExp(CommonStrings.oneUppercase).hasMatch(password)) {
      return CommonStrings.passwordUpperCase;
    } else if (!RegExp(CommonStrings.oneLowerCase).hasMatch(password)) {
      return CommonStrings.passwordLowerCase;
    } else if (!RegExp(CommonStrings.oneDigit).hasMatch(password)) {
      return CommonStrings.passwordDigits;
    } else if (!RegExp(CommonStrings.nonWordChar).hasMatch(password)) {
      return CommonStrings.passwordSymbol;
    } else {
      return null;
    }
  }

  String? _nameValidation(String? name) {
    if (name!.isEmpty) {
      return CommonStrings.wrongName;
    } else if (name.length < 6) {
      return CommonStrings.toShortName;
    } else {
      return null;
    }
  }

  bool isEmailValid(String value) =>
      RegExp(CommonStrings.emailRegEx).hasMatch(value);

  bool isNumberValid(String value) =>
      RegExp(CommonStrings.phoneRedEx).hasMatch(value);

  String? formFieldValidator(value) {
    if (hintText == CommonStrings.emailString) {
      return _emailVerification(value);
    } else if (hintText == CommonStrings.fullNameString) {
      return _nameValidation(value);
    } else if (hintText == CommonStrings.passwordString) {
      CommonStrings.temp = value;
      return _passwordValidation(value);
    } else if (hintText == CommonStrings.confirmPasswordString &&
        value != CommonStrings.temp) {
      return CommonStrings.confirmedPasswordNotMatched;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isObsecure,
      decoration: InputDecoration(
        hintText: hintText,
        constraints: const BoxConstraints(maxWidth: 355, maxHeight: 80),
        filled: true,
        fillColor: CommonColors.textForFieldTextColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        prefixIcon: icon,
        prefixIconColor: CommonColors.lightGreyColor,
      ),
      validator: formFieldValidator,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
