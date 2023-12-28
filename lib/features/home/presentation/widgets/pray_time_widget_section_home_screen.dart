import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/features/home/presentation/widgets/pray_time_widget_item.dart';
import 'package:flutter/material.dart';

class PrayTimeWidgetSectionHomeScreen extends StatelessWidget {
  const PrayTimeWidgetSectionHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PrayTimeWidgetItem(
                isEnabled: true,
                prayIcon: AppAssets.moonFajrIcon,
                prayName: 'Fajr',
                prayTime: '5:42'),
            PrayTimeWidgetItem(
                isEnabled: false,
                prayIcon: AppAssets.sunDuhurIcon,
                prayName: 'Duhur',
                prayTime: '5:42'),
            PrayTimeWidgetItem(
                isEnabled: false,
                prayIcon: AppAssets.sunAsrIcon,
                prayName: 'Asr',
                prayTime: '5:42'),
            PrayTimeWidgetItem(
                isEnabled: false,
                prayIcon: AppAssets.sunMaghribIcon,
                prayName: 'Maghrib',
                prayTime: '5:42'),
            PrayTimeWidgetItem(
                isEnabled: false,
                prayIcon: AppAssets.moonIshaIcon,
                prayName: 'Isha',
                prayTime: '5:42'),
          ],
        ),
        SizedBox(
          height: 35,
        ),
      ],
    );
  }
}
