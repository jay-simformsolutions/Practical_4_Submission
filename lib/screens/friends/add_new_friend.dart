import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../Routes/Routes.dart';
import '../../extensions/extensions.dart';
import '../../store/friend_store/contact_service_store.dart';
import '../../utils/colors.dart';
import '../../utils/common_strings.dart';
import '../../utils/theme_data.dart';

class AddNewFriend extends StatelessWidget {
  const AddNewFriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.readProvider<ContactServiceStore>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CommonColors.darkGrey,
      appBar: AppBar(
        backgroundColor: CommonColors.darkGrey,
        title: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: CommonStrings.textFormFieldOfAddNameEmail,
            hintStyle: themeData.textTheme.bodySmall!.copyWith(
              color: CommonColors.whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: CommonColors.whiteColor,
          ),
          onPressed: store.popScreen,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(
              builder: (_) {
                if (store.selectedName.isNotEmpty) {
                  return SizedBox(
                    height: 80,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Observer(
                        builder: (_) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: store.selectedName.length,
                            itemBuilder: (_, index) {
                              return SizedBox(
                                height: 70,
                                width: 70,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 10),
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: CommonColors.tealColor,
                                        child: Text(store.selectedName[index]
                                            .displayName![0]),
                                      ),
                                      Positioned(
                                        left: 25,
                                        child: GestureDetector(
                                          onTap: () =>
                                              store.removeFromFriendList(index),
                                          child: const Icon(
                                            Icons.cancel,
                                            size: 18,
                                            color: CommonColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            InkWell(
              onTap: () => store.navigateToScreen(Routes.addNewContact),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: CommonColors.tealColor.shade100,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.person_add,
                        size: 17,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Text(
                      CommonStrings.addNewContacts,
                      style: themeData.textTheme.bodySmall!.copyWith(
                        color: CommonColors.whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              CommonStrings.addNewContactFromList,
              style: themeData.textTheme.bodySmall!.copyWith(
                color: CommonColors.whiteColor,
              ),
            ),
            Observer(
              builder: (_) {
                return SizedBox(
                  height: 300,
                  child: store.isLoading == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : store.contacts.isEmpty
                          ? Center(
                              child: Text(
                                CommonStrings.noAnyContacts,
                                style:
                                    themeData.textTheme.titleMedium!.copyWith(
                                  color: CommonColors.whiteColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : Observer(
                              builder: (_) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: store.contacts.length,
                                  itemBuilder: (_, index) {
                                    return GestureDetector(
                                      onTap: () => store.addToFriendList(index),
                                      child: ListTile(
                                        leading: const CircleAvatar(
                                          radius: 18,
                                          child: Icon(Icons.phone),
                                        ),
                                        title: Text(
                                          store.contacts[index].givenName!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: themeData
                                              .textTheme.titleMedium!
                                              .copyWith(
                                            color: CommonColors.tealColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        subtitle: Text(
                                          store.contacts[index].phones![0]
                                              .value!,
                                          style: themeData.textTheme.bodySmall!
                                              .copyWith(
                                            color: CommonColors.lightGreyColor,
                                          ),
                                        ),
                                        trailing: Observer(
                                          builder: (_) {
                                            return store.selectedName.contains(
                                              store.contacts[index],
                                            )
                                                ? const Icon(
                                                    Icons.done,
                                                    color:
                                                        CommonColors.whiteColor,
                                                  )
                                                : const SizedBox();
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Your Favourite List is Here',
              style: themeData.textTheme.bodySmall!.copyWith(
                color: CommonColors.whiteColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  return SizedBox(
                    height: 300,
                    child: store.isLoading == true
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : store.favouriteFriendList.isEmpty
                            ? Center(
                                child: Text(
                                  CommonStrings.noAnyContacts,
                                  style:
                                      themeData.textTheme.titleMedium!.copyWith(
                                    color: CommonColors.whiteColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            : Observer(
                                builder: (_) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    itemCount: store.favouriteFriendList.length,
                                    itemBuilder: (_, index) {
                                      return ListTile(
                                        leading: const CircleAvatar(
                                          radius: 18,
                                          child: Icon(Icons.phone),
                                        ),
                                        title: Text(
                                          store.favouriteFriendList
                                              .elementAt(index)
                                              .givenName!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: themeData
                                              .textTheme.titleMedium!
                                              .copyWith(
                                            color: CommonColors.tealColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        subtitle: Text(
                                          store.favouriteFriendList
                                              .elementAt(index)
                                              .phones![0]
                                              .value!,
                                          style: themeData.textTheme.bodySmall!
                                              .copyWith(
                                            color: CommonColors.lightGreyColor,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => store.selectedName.isNotEmpty
            ? store.showConfirmFriendDialogToAddInList()
            : store.showSnackBar(),
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(
          Icons.arrow_forward,
          color: CommonColors.whiteColor,
        ),
      ),
    );
  }
}
