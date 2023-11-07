import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'unknown.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicWidget(
      smallScreen: () => UnknownScreenSmall(),
      largeScreen: () => UnknownScreenSmall(),
    );
  }
}
