import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:splitwise/extensions/extensions.dart';
import 'package:splitwise/store/authentication_store/sign_in_store.dart';
import 'package:splitwise/utils/theme_data.dart';

import '../Utils/assets.dart';
import '../common_methods/clip_react.dart';
import '../common_methods/sized_box_widget.dart';
import '../common_methods/text_formfield_widget.dart';
import '../routes/navigator_service.dart';
import '../routes/routes.dart';
import '../utils/colors.dart';
import '../utils/common_strings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.readProvider<SignInStore>();

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Form(
        key: store.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: ClipClipper(),
                    child: SizedBox(
                      height: 250,
                      width: size.width,
                      child: const Image(
                        image:
                            AssetImage(AssetString.landingPageLoginImageString),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 25,
                    child: FloatingActionButton.small(
                      onPressed: () => NavigationService.instance
                          .navigateToScreen(Routes.signupPage),
                      backgroundColor: CommonColors.whiteColor,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                CommonStrings.welcomeBackString,
                style: themeData.textTheme.bodyMedium,
              ),
              Text(
                CommonStrings.loginToAccountString,
                style: themeData.textTheme.titleSmall,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormFieldWidget(
                hintText: CommonStrings.fullNameString,
                icon: const Icon(
                  Icons.person_outline_outlined,
                ),
                isObsecure: false,
              ),
              const SizedBoxWidget(),
              TextFormFieldWidget(
                hintText: CommonStrings.passwordString,
                icon: const Icon(Icons.lock),
                isObsecure: true,
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Observer(builder: (context) {
                      return Checkbox(
                        shape: const CircleBorder(),
                        checkColor: Colors.black,
                        activeColor: Colors.grey,
                        value: store.changeState,
                        onChanged: store.changedValue,
                      );
                    }),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      CommonStrings.rememberMeString,
                      style: themeData.textTheme.bodySmall,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => NavigationService.instance
                          .navigateToScreen(Routes.forgotPassword),
                      child: Text(
                        CommonStrings.forgotPasswordString,
                        style: themeData.textTheme.bodySmall?.copyWith(
                          color: CommonColors.lightGreenColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              ElevatedButton(
                onPressed: store.clickForSignIn,
                style: themeData.elevatedButtonTheme.style?.copyWith(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      CommonColors.lightGreyColor),
                ),
                child: Text(
                  CommonStrings.loginString,
                  style: themeData.textTheme.titleMedium
                      ?.copyWith(color: CommonColors.whiteColor),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    CommonStrings.doNotHaveAccountString,
                    style: themeData.textTheme.bodySmall,
                  ),
                  GestureDetector(
                    onTap: store.pushAndRemoveSignUp,
                    child: Text(
                      CommonStrings.signupString,
                      style: themeData.textTheme.bodySmall?.copyWith(
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
    );
  }
}
