import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

import '../../common_methods/theme_data.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';

class VerifyFriendsInfo extends StatefulWidget {
  final List<Contact> selectedName;
  const VerifyFriendsInfo({
    Key? key,
    required this.selectedName,
  }) : super(key: key);

  @override
  State<VerifyFriendsInfo> createState() => _VerifyFriendsInfoState();
}

class _VerifyFriendsInfoState extends State<VerifyFriendsInfo> {
  void showCompleteVerification() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            CommonStrings.friendsAdded,
            style: themeData.textTheme.titleMedium,
          ),
          content: Text(
            CommonStrings.letThemKnow,
            style: themeData.textTheme.bodySmall,
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  CommonStrings.sendTextMessage,
                  style: themeData.textTheme.bodySmall!.copyWith(
                    color: CommonColors.tealColor,
                  ),
                )),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.darkGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text(
          CommonStrings.verifyContacts,
          style: themeData.textTheme.titleSmall!.copyWith(
            color: CommonColors.whiteColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.selectedName.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child:
                              Text(widget.selectedName[index].displayName![0]),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.selectedName[index].displayName!,
                              style: themeData.textTheme.bodySmall!.copyWith(
                                color: CommonColors.whiteColor,
                              ),
                            ),
                            Text(
                              widget.selectedName[index].phones![0].value!
                                  .toString(),
                              style: themeData.textTheme.bodySmall!.copyWith(
                                color: CommonColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
              minimumSize: const Size.fromHeight(40)),
          onPressed: () {
            showCompleteVerification();
          },
          child: const Text(CommonStrings.finishString),
        ),
      ),
    );
  }
}
