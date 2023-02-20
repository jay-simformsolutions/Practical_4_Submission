import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splitwise/Utils/common_strings.dart';

import '../CommonMethodClass/theme_data.dart';
import '../Utils/colors.dart';

class GroupPageInfo extends StatefulWidget {
  const GroupPageInfo({Key? key}) : super(key: key);

  @override
  State<GroupPageInfo> createState() => _GroupPageInfoState();
}

class _GroupPageInfoState extends State<GroupPageInfo> {
  List _groups = [];

  Future<List> getGroupDetails() async {
    final String response =
        await rootBundle.loadString(CommonStrings.loadGroupJson);
    final data = await json.decode(response);
    setState(
      () {
        _groups = data['groups'];
      },
    );
    return _groups;
  }

  @override
  void initState() {
    getGroupDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.whiteColor,
      appBar: AppBar(
        backgroundColor: CommonColors.whiteColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: CommonColors.blackColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.group_add_outlined),
            color: CommonColors.blackColor,
          ),
        ],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: CommonColors.blackColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Divider(),
            Row(
              children: [
                Text(
                  CommonStrings.youAllAreSet,
                  style: themeData.textTheme.bodySmall!.copyWith(
                    fontSize: 20,
                    color: CommonColors.blackColor,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.menu_open_rounded,
                  size: 30,
                  color: CommonColors.blackColor,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _groups.isEmpty
                ? const CircularProgressIndicator()
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _groups.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 5, 0, 0),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      _groups[index]['group_image']!,
                                    ),
                                    radius: 35,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  _groups[index]['name'],
                                  style:
                                      themeData.textTheme.bodySmall!.copyWith(
                                    color: CommonColors.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
