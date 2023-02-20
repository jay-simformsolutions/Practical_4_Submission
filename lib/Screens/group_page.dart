import 'package:flutter/material.dart';

import '../Utils/common_strings.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.group_add_outlined),
          ),
        ],
      ),
      body: const Center(
        child: Text(CommonStrings.groupBottomTitle),
      ),
    );
  }
}
