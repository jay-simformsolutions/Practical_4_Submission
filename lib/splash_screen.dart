import 'package:flutter/material.dart';
import 'package:splitwise/utils/colors.dart';
import 'package:splitwise/utils/common_strings.dart';
import 'package:splitwise/utils/theme_data.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.blackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              CommonStrings.welcomeSplitwise,
              style: themeData.textTheme.bodyMedium!
                  .copyWith(color: CommonColors.whiteColor),
            ),
            Text(
              'to',
              style: themeData.textTheme.bodyMedium!
                  .copyWith(color: CommonColors.whiteColor),
            ),
            Text(
              CommonStrings.splitwise,
              style: themeData.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
