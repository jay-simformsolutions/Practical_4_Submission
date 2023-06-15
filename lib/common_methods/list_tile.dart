import 'package:flutter/material.dart';

import '../utils/theme_data.dart';

class ListTileWidget extends StatelessWidget {
  final Icon icon;
  final String menuName;
  const ListTileWidget({Key? key, required this.icon, required this.menuName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        menuName,
        style: themeData.textTheme.bodySmall,
      ),
    );
  }
}
