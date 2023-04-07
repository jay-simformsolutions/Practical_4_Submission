import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:splitwise/Routes/Routes.dart';
import 'package:splitwise/common_methods/theme_data.dart';
import 'package:splitwise/routes/navigation_functions.dart';
import 'package:splitwise/utils/colors.dart';

import '../utils/common_strings.dart';

class BioMetricPage extends StatefulWidget {
  const BioMetricPage({Key? key}) : super(key: key);

  @override
  State<BioMetricPage> createState() => _BioMetricPageState();
}

class _BioMetricPageState extends State<BioMetricPage> {
  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric = false;
  String authorized = 'Not authorized';

  @override
  void initState() {
    _checkBiometric().then(
      (value) => value
          ? _authenticate()
          : context.pushFunction(Routes.bottomNavigationPage),
    );
    // TODO: implement initState
    super.initState();
  }

  ///checking biometrics
  ///this function will check the sensors and will tell us
  /// if we can use them or not
  Future<bool> _checkBiometric() async {
    _canCheckBiometric = await auth.canCheckBiometrics;
    return _canCheckBiometric;
  }

  ///this function will open an authentication dialog
  /// and it will check if we are authenticated or not
  /// so we will add the major action here like moving to another activity
  /// or just display a text that will tell us that we are authenticated
  /// Check if BioMetric Set or Not and based on that Show Warning
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
          localizedReason: CommonStrings.scanYourFinger,
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: false,
          ));
    } on PlatformException catch (e) {
      showSnackBar(
        const Text("Please Enable Bio-Metric"),
      );
      context.pushFunction(Routes.bottomNavigationPage);
    }
    if (!mounted) return;

    setState(() {
      authorized = authenticated
          ? CommonStrings.successAuthenticate
          : CommonStrings.failedAuthenticate;
    });
    if (authorized == CommonStrings.successAuthenticate) {
      context.pushFunction(Routes.bottomNavigationPage);
    }
  }

  void showSnackBar(Widget content) {
    SnackBar snackBar = SnackBar(content: content);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          barrierDismissible: false,
          barrierColor: Colors.white,
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              CommonStrings.titleOfAuthenticate,
              style: themeData.textTheme.titleSmall!.copyWith(
                color: CommonColors.blackColor,
              ),
            ),
            content: const Text(CommonStrings.unlockSplitwise),
            actions: [
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CommonColors.whiteColor,
                  ),
                  onPressed: () => exit(0),
                  child: Text(
                    CommonStrings.cancelString,
                    style: themeData.textTheme.bodySmall,
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _checkBiometric();
                    _authenticate();
                    //_authenticate();
                  },
                  child: const Text(CommonStrings.unlockPlease),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: const Scaffold(
        backgroundColor: CommonColors.whiteColor,
      ),
    );
  }
}
