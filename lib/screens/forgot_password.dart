import 'package:flutter/material.dart';
import 'package:splitwise/extensions/extensions.dart';
import 'package:splitwise/utils/theme_data.dart';

import '../Utils/assets.dart';
import '../common_methods/clip_react.dart';
import '../common_methods/text_formfield_widget.dart';
import '../routes/navigator_service.dart';
import '../store/authentication_store/forgot_password_store.dart';
import '../utils/colors.dart';
import '../utils/common_strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.readProvider<ForgotPasswordStore>();

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: ClipClipper(),
                child: SizedBox(
                  height: 250,
                  width: size.width,
                  child: const Image(
                    image: AssetImage(AssetString.landingPageLoginImageString),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 25,
                child: FloatingActionButton.small(
                  onPressed: NavigationService.instance.goBack,
                  backgroundColor: CommonColors.whiteColor,
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height / 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                CommonStrings.forgotPasswordString,
                style: themeData.textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Form(
                  key: store.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormFieldWidget(
                        hintText: CommonStrings.emailString,
                        icon: const Icon(Icons.email_outlined),
                        isObsecure: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: store.conditionToShowAlertDialog,
                        style: themeData.elevatedButtonTheme.style?.copyWith(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            CommonColors.lightGreenColor,
                          ),
                        ),
                        child: const Text(CommonStrings.sendEmail),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
