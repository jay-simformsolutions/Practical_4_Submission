import 'package:flutter/material.dart';

import '../../Utils/colors.dart';
import '../../Utils/common_strings.dart';

class CreateNewGroup extends StatelessWidget {
  const CreateNewGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CommonColors.whiteColor,
        iconTheme: const IconThemeData(
          color: CommonColors.blackColor,
        ),
      ),
      body: const Center(
        child: Text(CommonStrings.createNewGroup),
      ),
    );
  }
}
