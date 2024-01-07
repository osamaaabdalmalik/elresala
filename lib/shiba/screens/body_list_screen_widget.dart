import 'package:flutter/material.dart';

class BodyListScreenWidget extends StatelessWidget {
  const BodyListScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20,),
        const VerticalDivider(color: Colors.white),
        const Column(
          children: [
            Text('Website'),
            Text('Learn, Read at the quran'),
          ],
        ),
        const Spacer(),
        IconButton(onPressed: (){}, icon: const Icon(Icons.circle_notifications)),
        IconButton(onPressed: (){}, icon: const Icon(Icons.chevron_right_outlined)),
      ],
    );
  }
}
