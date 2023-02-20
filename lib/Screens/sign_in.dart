import 'package:flutter/material.dart';
import 'package:splitwise/Utils/assets.dart';

import '../CommonMethodClass/clip_react.dart';
import '../CommonMethodClass/sized_box_widget.dart';
import '../CommonMethodClass/text_formfield_widget.dart';
import '../Routes/navigation_functions.dart';
import '../Routes/routes.dart';
import '../Utils/colors.dart';
import '../Utils/common_strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeState = false;
  String value = 'jay';

  final _formKey = GlobalKey<FormState>();

  pushAndRemoveSignUp() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.signupPage,
      (routes) => false,
    );
  }

  void _clickForSignIn() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
      Navigator.pushNamed(context, Routes.loginPage);
    }
  }

  void _changedValue(bool? value) {
    setState(() {
      changeState = !changeState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: ClipClipper(),
                    child: SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
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
                      onPressed: () => context.pushAndRemove(Routes.signupPage),
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
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                CommonStrings.loginToAccountString,
                style: Theme.of(context).textTheme.titleSmall,
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
                    Checkbox(
                      shape: const CircleBorder(),
                      checkColor: Colors.black,
                      activeColor: Colors.grey,
                      value: changeState,
                      onChanged: _changedValue,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      CommonStrings.rememberMeString,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => context.pushFunction(Routes.forgotPassword),
                      child: Text(
                        CommonStrings.forgotPasswordString,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                onPressed: _clickForSignIn,
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          CommonColors.lightGreenColor),
                    ),
                child: Text(
                  CommonStrings.loginString,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: CommonColors.whiteColor),
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
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  GestureDetector(
                    onTap: () => pushAndRemoveSignUp(),
                    child: Text(
                      CommonStrings.signupString,
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
    );
  }
}
