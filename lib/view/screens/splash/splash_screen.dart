import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicWidget(
      smallScreen: () => SplashScreenSmall(),
      largeScreen: () => SplashScreenSmall(),
    );
  }
}
