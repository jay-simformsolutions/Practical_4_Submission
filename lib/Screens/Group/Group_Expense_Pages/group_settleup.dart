import 'package:flutter/material.dart';
import 'package:splitwise/Utils/common_strings.dart';

class GroupSettleUp extends StatelessWidget {
  const GroupSettleUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(CommonStrings.groupSettleUp),
      ),
    );
  }
}
