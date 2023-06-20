import 'package:flutter/material.dart';

import '../enum/enum.dart';

class ManageNetworkState extends StatelessWidget {
  const ManageNetworkState(
      {Key? key,
      required this.shimmerWidget,
      required this.errorWidget,
      required this.successWidget,
      required this.state})
      : super(key: key);

  final Widget shimmerWidget;
  final Widget errorWidget;
  final Widget successWidget;
  final NetworkState state;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case NetworkState.initial:
        return SizedBox.shrink();
      case NetworkState.loading:
        return shimmerWidget;
      case NetworkState.success:
        return successWidget;
      case NetworkState.failure:
        return errorWidget;
    }
  }
}
