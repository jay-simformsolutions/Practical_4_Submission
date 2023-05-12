import 'package:flutter/cupertino.dart';

import '../utils/colors.dart';
import '../utils/theme_data.dart';

class ListOfCategory extends StatelessWidget {
  final String? iconName;
  final IconData? iconData;
  final Color color;

  const ListOfCategory(
      {Key? key, this.iconName, this.iconData, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              color: color,
              child: Icon(
                iconData,
                size: 35,
                color: CommonColors.whiteColor,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              iconName!,
              style: themeData.textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
