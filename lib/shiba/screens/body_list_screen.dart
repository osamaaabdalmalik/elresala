import 'package:flutter/material.dart';

import 'body_list_screen_widget.dart';

class BodyListScreen extends StatelessWidget {
  const BodyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(10, (index) => const BodyListScreenWidget()),
    );
  }
}
