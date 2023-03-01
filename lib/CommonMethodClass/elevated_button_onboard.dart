import 'package:flutter/material.dart';

import '../Utils/colors.dart';
import 'theme_data.dart';

class ElevatedButtonOnBoard extends StatelessWidget {
  final String? buttonName;
  final Icon? icon;
  final VoidCallback? onPress;

  const ElevatedButtonOnBoard({
    Key? key,
    this.buttonName,
    this.icon,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: ElevatedButton.icon(
        onPressed: onPress,
        icon: icon!,
        label: Padding(
          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
          child: Text(
            buttonName!,
            style: themeData.textTheme.bodySmall!.copyWith(
              color: CommonColors.tealColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: CommonColors.whiteColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          side: const BorderSide(color: CommonColors.tealColor),
        ),
      ),
    );
  }
}
