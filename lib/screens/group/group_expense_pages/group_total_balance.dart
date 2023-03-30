import 'package:flutter/material.dart';

import '../../../utils/common_strings.dart';

class TotalGroupExpense extends StatelessWidget {
  const TotalGroupExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(CommonStrings.groupTotalBalances),
      ),
    );
  }
}
