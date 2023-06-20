import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GroupInfoShimmer extends StatelessWidget {
  const GroupInfoShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Shimmer.fromColors(
                    highlightColor: Colors.grey,
                    baseColor: Colors.white,
                    child: CircleAvatar(
                      radius: 35,
                    ),
                  ),
                  Spacer(),
                  Shimmer.fromColors(
                    highlightColor: Colors.grey,
                    baseColor: Colors.white,
                    child: Card(
                      child: SizedBox(
                        width: 150,
                        height: 15,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        );
      },
    );
  }
}
