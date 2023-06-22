import 'package:splitwise/enum/enviroment.dart';

class FlavorConfig {
  FlavorConfig._({required this.flavor});

  final Flavor flavor;

  static FlavorConfig? instance;

  static bool get isDev => instance?.flavor == Flavor.dev;
  static bool get isProd => instance?.flavor == Flavor.prod;

  static void init({
    required Flavor flavor,
  }) {
    instance ??= FlavorConfig._(
      flavor: flavor,
    );
  }
}
