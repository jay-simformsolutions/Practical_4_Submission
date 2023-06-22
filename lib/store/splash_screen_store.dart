import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:splitwise/Routes/Routes.dart';
import 'package:splitwise/routes/navigator_service.dart';

part 'splash_screen_store.g.dart';

class SplashScreenStore = _SplashScreenStore with _$SplashScreenStore;

abstract class _SplashScreenStore with Store {
  _SplashScreenStore() {
    debugPrint('Main prod is called');
    gotoHomeScree();
  }

  Future<void> gotoHomeScree() async {
    await Future.delayed(Duration(seconds: 3));
    NavigationService.instance.navigateToScreen(Routes.bioMetric);
  }
}
