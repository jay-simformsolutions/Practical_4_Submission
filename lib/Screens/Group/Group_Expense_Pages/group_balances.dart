import 'package:flutter/material.dart';
import 'package:splitwise/Utils/common_strings.dart';

class GroupBalance extends StatelessWidget {
  const GroupBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(CommonStrings.groupBalances),
      ),
    );
  }
}
