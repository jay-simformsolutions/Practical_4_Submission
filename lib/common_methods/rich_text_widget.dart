import 'package:flutter/material.dart';

import '../utils/colors.dart';

class RichTextWidget extends StatelessWidget {
  final String? greenText;
  final String? greyText;
  const RichTextWidget({
    Key? key,
    required this.greyText,
    required this.greenText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: greenText,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: CommonColors.lightGreenColor,
                ),
          ),
          TextSpan(
            text: greyText,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
