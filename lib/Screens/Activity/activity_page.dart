import 'package:flutter/material.dart';

import '../../Utils/common_strings.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(CommonStrings.activityHeadline),
      ),
    );
  }
}
