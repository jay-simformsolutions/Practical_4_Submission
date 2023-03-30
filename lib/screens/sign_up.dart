import 'package:flutter/material.dart';

import '../common_methods/rich_text_widget.dart';
import '../common_methods/sized_box_widget.dart';
import '../common_methods/text_formfield_widget.dart';
import '../routes/navigation_functions.dart';
import '../routes/routes.dart';
import '../utils/colors.dart';
import '../utils/common_strings.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  void _clickForSignUp() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
      Navigator.pushNamed(context, Routes.loginPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 70, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    FloatingActionButton.small(
                      onPressed: () => context.pushAndRemove(Routes.homePage),
                      backgroundColor: CommonColors.lightGreyColor,
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      CommonStrings.registerString,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Text(
                  CommonStrings.createAccountString,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  hintText: CommonStrings.fullNameString,
                  icon: const Icon(Icons.person_2_outlined),
                  isObsecure: false,
                ),
                const SizedBoxWidget(),
                TextFormFieldWidget(
                  hintText: CommonStrings.emailString,
                  icon: const Icon(Icons.email_outlined),
                  isObsecure: false,
                ),
                const SizedBoxWidget(),
                TextFormFieldWidget(
                  hintText: CommonStrings.passwordString,
                  icon: const Icon(Icons.lock_rounded),
                  isObsecure: true,
                ),
                const SizedBoxWidget(),
                TextFormFieldWidget(
                  hintText: CommonStrings.confirmPasswordString,
                  icon: const Icon(
                    Icons.lock_rounded,
                  ),
                  isObsecure: true,
                ),
                const SizedBox(
                  height: 5,
                ),
                const RichTextWidget(
                  greenText: CommonStrings.agreePolicyString,
                  greyText: CommonStrings.teamOfUseString,
                ),
                const RichTextWidget(
                  greenText: CommonStrings.andString,
                  greyText: CommonStrings.privacyNoticeString,
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: _clickForSignUp,
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text(
                    CommonStrings.signupString,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: CommonColors.whiteColor,
                        ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      CommonStrings.doHaveAccountString,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    GestureDetector(
                      onTap: () => context.pushAndRemove(Routes.loginPage),
                      child: Text(
                        CommonStrings.loginString,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: CommonColors.lightGreenColor,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
