import 'package:elresala/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DownloadCard extends StatefulWidget {
  final String title;
  final double progress;
  final int downloadedCount;
  final int totalCount;
  final Function() onDownloadTab;

  // final Function() onPauseTab;
  // final Function() onResumeTab;
  // final Function() onCancelTab;
  // final Function() onDeleteTab;

  const DownloadCard({
    super.key,
    required this.title,
    required this.progress,
    required this.downloadedCount,
    required this.totalCount,
    required this.onDownloadTab,
  });

  @override
  State<DownloadCard> createState() => _DownloadCardState();
}

class _DownloadCardState extends State<DownloadCard> {
  bool isStartDownload = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.kGreenColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: AppColors.kWhiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              isStartDownload
                  ? CircularPercentIndicator(
                      radius: 25,
                      lineWidth: 5.0,
                      percent: widget.progress,
                      center: Text(
                        "${(widget.progress * 10).toStringAsFixed(0)}%",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      progressColor: AppColors.kGoldenColor,
                      backgroundColor: AppColors.kPrimaryColor,
                      animation: true,
                      footer: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text("${widget.downloadedCount}/${widget.totalCount}"),
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        isStartDownload = true;
                        widget.onDownloadTab();
                      },
                      icon: const Icon(
                        Icons.download,
                        color: AppColors.kWhiteColor,
                      ),
                    )
            ],
          ),
        ],
      ),
    );
  }
}
