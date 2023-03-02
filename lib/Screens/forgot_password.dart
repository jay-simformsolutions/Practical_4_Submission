import 'package:flutter/material.dart';
import 'package:splitwise/Utils/assets.dart';

import '../CommonMethodClass/clip_react.dart';
import '../CommonMethodClass/text_formfield_widget.dart';
import '../Routes/navigation_functions.dart';
import '../Utils/colors.dart';
import '../Utils/common_strings.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  Future<dynamic> showAlertDialog() async {
    return showDialog(
      context: context,
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
              onPressed: () => context.popFunction(),
              child: const Text(
                CommonStrings.okString,
              ),
            ),
            ElevatedButton(
              onPressed: () => context.popFunction(),
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
    if (_formKey.currentState!.validate()) {
      showAlertDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: ClipClipper(),
                child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
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
                  onPressed: () => context.popFunction(),
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
            height: MediaQuery.of(context).size.height / 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                CommonStrings.forgotPasswordString,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Form(
                  key: _formKey,
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
                        onPressed: conditionToShowAlertDialog,
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .copyWith(
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
