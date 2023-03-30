import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'theme_data.dart';

class ShowRecipient extends StatelessWidget {
  final String? imageURL;
  final String? name;
  const ShowRecipient({Key? key, this.imageURL, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageURL!),
          radius: 25,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          name!,
          style: themeData.textTheme.bodySmall!.copyWith(
            color: CommonColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
