import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';

import '../../Routes/Routes.dart';
import '../../routes/navigator_service.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';
import '../../utils/theme_data.dart';

part 'bio_metric_store.g.dart';

class BioMetricStore = _BioMetricStore with _$BioMetricStore;

abstract class _BioMetricStore with Store, WidgetsBindingObserver {
  _BioMetricStore() {
    WidgetsBinding.instance.addObserver(this);
    _checkBiometric().then(
      (value) => value
          ? _authenticate()
          : NavigationService().navigateToScreen(Routes.bottomNavigationPage),
    );
  }

  @observable
  bool _canCheckBiometric = false;

  @observable
  String authorized = 'Not authorized';

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (AppLifecycleState.resumed == state) {
      debugPrint('State is $state');
      NavigationService().navigateToScreen('/');
    }
  }

  LocalAuthentication auth = LocalAuthentication();

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
    } on PlatformException catch (_) {
      showSnackBar(
        const Text(CommonStrings.enableBioMetric),
      );
      NavigationService().navigateToScreen(Routes.bottomNavigationPage);
    }

    debugPrint('Authorized String is $authorized');
    authorized = authenticated
        ? CommonStrings.successAuthenticate
        : CommonStrings.failedAuthenticate;

    if (authorized == CommonStrings.successAuthenticate) {
      NavigationService().navigateToScreen(Routes.bottomNavigationPage);
    }
  }

  void showSnackBar(Widget content) {
    SnackBar snackBar = SnackBar(content: content);
    ScaffoldMessenger.of(NavigationService().context).showSnackBar(snackBar);
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          barrierDismissible: false,
          barrierColor: Colors.white,
          context: NavigationService().context,
          builder: (_) => AlertDialog(
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
                    NavigationService().goBack();
                    _checkBiometric();
                    _authenticate();
                  },
                  child: const Text(CommonStrings.unlockPlease),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}
