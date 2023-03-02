import 'package:flutter/material.dart';

import '../../Utils/colors.dart';
import '../../Utils/common_strings.dart';

class GroupInformation extends StatelessWidget {
  const GroupInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CommonColors.whiteColor,
        iconTheme: const IconThemeData(
          color: CommonColors.blackColor,
        ),
        elevation: 3,
      ),
      body: const Center(
        child: Text(CommonStrings.groupInformation),
      ),
    );
  }
}
