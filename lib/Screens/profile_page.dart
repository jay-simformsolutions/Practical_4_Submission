import 'package:flutter/material.dart';

import '../Utils/common_strings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(CommonStrings.profileBottomTitle),
      ),
    );
  }
}
