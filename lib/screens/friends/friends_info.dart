import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/common_strings.dart';

class FriendInformation extends StatelessWidget {
  const FriendInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CommonColors.whiteColor,
        elevation: 3,
        iconTheme: const IconThemeData(
          color: CommonColors.blackColor,
        ),
      ),
      body: const Center(
        child: Text(CommonStrings.showFriendInfo),
      ),
    );
  }
}
