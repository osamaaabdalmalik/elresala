import 'package:elresala/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:elresala/features/quran/presentation/screens/widgets/telawa_sliver_context.dart';
import 'package:flutter/material.dart';

class TelawaScreen extends StatelessWidget {
  const TelawaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBarWidget(isSearch: true),
                QariSliverAdapter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
