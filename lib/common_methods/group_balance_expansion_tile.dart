import 'package:flutter/material.dart';
import 'package:splitwise/common_methods/theme_data.dart';

import '../utils/colors.dart';

class ExpansionTileWidget extends StatelessWidget {
  final String? imageURL;
  final String? name;
  const ExpansionTileWidget({Key? key, this.imageURL, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageURL!),
            radius: 25,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              '$name is settle up',
              style: themeData.textTheme.bodySmall!.copyWith(
                color: CommonColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
