import 'package:flutter/material.dart';

import '../../../common_methods/group_balance_expansion_tile.dart';
import '../../../common_methods/theme_data.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_strings.dart';

class GroupBalance extends StatelessWidget {
  const GroupBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        title: Text(
          CommonStrings.groupBalances,
          style: themeData.textTheme.titleMedium!
              .copyWith(color: CommonColors.whiteColor),
        ),
        elevation: 0,
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Column(
        children: const [
          ExpansionTileWidget(
            imageURL:
                'https://s3.amazonaws.com/splitwise/uploads/group/default_avatars/avatar-ruby2-house-200px.png',
            name: 'Sahil Totala',
          ),
          ExpansionTileWidget(
            imageURL:
                'https://s3.amazonaws.com/splitwise/uploads/user/default_avatars/avatar-blue22-50px.png',
            name: 'Parth Vora',
          ),
          ExpansionTileWidget(
            imageURL:
                'https://s3.amazonaws.com/splitwise/uploads/group/default_avatars/v2021/avatar-nongroup-50px.png',
            name: 'Shaukat Ali Momin',
          ),
          ExpansionTileWidget(
            imageURL:
                'https://s3.amazonaws.com/splitwise/uploads/group/default_avatars/avatar-ruby2-house-200px.png',
            name: 'Apurva Kanthraviya',
          ),
        ],
      ),
    );
  }
}
