import 'package:flutter/material.dart';

extension PushFunction on BuildContext {
  void pushFunction(screen) => Navigator.pushNamed(this, screen);
}

extension PopFunction on BuildContext {
  void popFunction(screen) => Navigator.of(this).pop();
}

extension PopAndRemove on BuildContext {
  void pushAndRemove(screen) =>
      Navigator.of(this).pushNamedAndRemoveUntil(screen, (routes) => false);
}
