import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GroupExpenseShimmer extends StatelessWidget {
  const GroupExpenseShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Shimmer.fromColors(
              highlightColor: Colors.grey,
              baseColor: Colors.white,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: SizedBox.square(
                  dimension: 50,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  highlightColor: Colors.grey,
                  baseColor: Colors.white,
                  child: Card(
                    child: SizedBox(
                      height: 20,
                      width: 150,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Shimmer.fromColors(
                  highlightColor: Colors.grey,
                  baseColor: Colors.white,
                  child: Card(
                    child: SizedBox(
                      height: 20,
                      width: 200,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            // Shimmer.fromColors(
            //   highlightColor: Colors.grey,
            //   baseColor: Colors.white,
            //   child: Card(
            //     child: SizedBox(
            //       height: 15,
            //       width: 100,
            //     ),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
