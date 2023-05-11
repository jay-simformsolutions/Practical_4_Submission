import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dispose_interface/dispose.dart';

extension WithProvider on Widget {
  Widget withProvider<T>(T provider) => Provider(
        create: (_) => provider,
        child: this,
        dispose: (context, value) {
          if (value is DisposeController) {
            value.dispose();
            debugPrint(value.toString());
            debugPrint('Values is Dispose');
          }
        },
      );

  Widget withMultiProvider<T>(List<Provider<T>> providers) => MultiProvider(
        providers: providers,
        child: this,
      );
}

extension ContextExtensions on BuildContext {
  T readProvider<T>() => Provider.of<T>(this, listen: false);
}
