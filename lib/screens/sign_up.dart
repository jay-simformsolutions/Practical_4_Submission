import 'package:flutter/material.dart';
import 'package:splitwise/extensions/extensions.dart';

import '../common_methods/rich_text_widget.dart';
import '../common_methods/sized_box_widget.dart';
import '../common_methods/text_formfield_widget.dart';
import '../routes/navigator_service.dart';
import '../routes/routes.dart';
import '../store/authentication_store/sign_up_store.dart';
import '../utils/colors.dart';
import '../utils/common_strings.dart';
import '../utils/theme_data.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.readProvider<SignUpStore>();
    final theme = themeData.textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: store.formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 70, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    FloatingActionButton.small(
                      onPressed: () => NavigationService.instance
                          .navigateToScreen(Routes.homePage),
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
                      style: theme.bodyMedium,
                    ),
                  ],
                ),
                Text(
                  CommonStrings.createAccountString,
                  style: theme.titleSmall,
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
                  onPressed: store.clickForSignUp,
                  style: themeData.elevatedButtonTheme.style,
                  child: Text(
                    CommonStrings.signupString,
                    style: theme.titleMedium!.copyWith(
                      color: CommonColors.whiteColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      CommonStrings.doHaveAccountString,
                      style: theme.bodySmall,
                    ),
                    GestureDetector(
                      onTap: () => NavigationService.instance
                          .navigateToScreen(Routes.loginPage),
                      child: Text(
                        CommonStrings.loginString,
                        style: theme.bodySmall?.copyWith(
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
