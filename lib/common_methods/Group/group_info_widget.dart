import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitwise/store/group_store/group_info_store.dart';

import '../../Routes/Routes.dart';
import '../../routes/navigator_service.dart';
import '../../utils/colors.dart';
import '../../utils/theme_data.dart';

class ListOfGroups extends StatelessWidget {
  const ListOfGroups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.read<GroupInfoStore>();
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: store.groups.length,
      itemBuilder: (_, index) {
        return Card(
          child: InkWell(
            onTap: () => NavigationService.instance.navigateToScreen(
              Routes.groupExpense,
              arguments: store.groups[index],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(store.groups[index].groupImage!),
                      radius: 35,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    store.groups[index].name!,
                    style: themeData.textTheme.bodySmall!.copyWith(
                      color: CommonColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () =>
                        store.showDeleteDialog(store.groups[index].id!),
                    icon: Icon(Icons.delete),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
