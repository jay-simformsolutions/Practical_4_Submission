import 'package:flutter/material.dart';

import '../../../common_methods/group_settleup.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_strings.dart';
import '../../../utils/theme_data.dart';

class GroupSettleUp extends StatelessWidget {
  const GroupSettleUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.darkGrey,
      appBar: AppBar(
        backgroundColor: CommonColors.darkGrey,
        title: Text(
          CommonStrings.groupSettleUp,
          style: themeData.textTheme.titleMedium!
              .copyWith(color: CommonColors.whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            ShowRecipient(
              imageURL:
                  'https://s3.amazonaws.com/splitwise/uploads/group/default_avatars/avatar-ruby2-house-200px.png',
              name: 'Sahil Totala',
            ),
            SizedBox(
              height: 10,
            ),
            ShowRecipient(
              imageURL:
                  'https://s3.amazonaws.com/splitwise/uploads/user/default_avatars/avatar-blue22-50px.png',
              name: 'Parth Vora',
            ),
            SizedBox(
              height: 10,
            ),
            ShowRecipient(
              imageURL:
                  'https://s3.amazonaws.com/splitwise/uploads/group/default_avatars/v2021/avatar-nongroup-50px.png',
              name: 'Apurva Kanthraviya',
            ),
          ],
        ),
      ),
    );
  }
}
