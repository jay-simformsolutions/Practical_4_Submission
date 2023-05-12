import 'package:flutter/material.dart';

import '../extensions/extensions.dart';
import '../store/bio_metric_store/bio_metric_store.dart';
import '../utils/colors.dart';

class BioMetricPage extends StatelessWidget {
  const BioMetricPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: context.readProvider<BioMetricStore>().showExitPopup,
      child: const Scaffold(
        backgroundColor: CommonColors.whiteColor,
      ),
    );
  }
}
