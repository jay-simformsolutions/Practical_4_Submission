import 'package:flutter/material.dart';
import 'package:splitwise/Utils/assets.dart';

import '../Routes/navigation_functions.dart';
import '../Routes/routes.dart';
import '../Utils/colors.dart';
import '../Utils/common_strings.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              image: AssetImage(AssetString.landingPageImageString),
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        CommonStrings.welcomeString,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      CommonStrings.welcomeSecondLine,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      CommonStrings.welcomeThirdLine,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () => context.pushFunction(Routes.signupPage),
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                CommonColors.whiteColor,
                              ),
                            ),
                    child: Text(
                      CommonStrings.signupString,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => context.pushFunction(Routes.loginPage),
                  style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.all(0)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          CommonColors.lightGreenColor,
                        ),
                      ),
                  child: Text(
                    CommonStrings.loginString,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: CommonColors.whiteColor,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
