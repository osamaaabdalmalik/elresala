import 'package:elresala/features/sites/presentation/widget/container_custom.dart';
import 'package:flutter/material.dart';

class InkwellCustom extends StatelessWidget {
  final void Function() onTap;
  final bool catigory;
  final String dataText;
  final IconData? iconData;
  const InkwellCustom(
      {super.key,
      required this.onTap,
      required this.catigory,
      required this.dataText,
      this.iconData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: ContainerCustom(
          iconData: iconData,
          catigory: catigory,
          dataText: dataText,
        ));
  }
}
