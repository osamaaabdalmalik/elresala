
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/constants/app_colors.dart';
import '../Widget/custom_text_muslim.dart';
import '../controller/muslim_controller.dart';
class MuslimView extends StatefulWidget {
  const MuslimView({super.key});

  @override
  State<MuslimView> createState() => _MuslimViewState();
}

class _MuslimViewState extends State<MuslimView> {
  MuslimController controller = Get.put(MuslimController());

   late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  late var objectView;

  @override
  void initState() {
   objectView=controller.isMoslimModel
        ? controller
        .DataViewList[controller.course_number]
        .lessons[controller.lisson_number]
        .nestedTopics[controller.artical_number]
        : controller.DataViewList[controller.course_number]
        .lessons[controller.lisson_number];
    super.initState();
    _controller = YoutubePlayerController(
     initialVideoId:extractVideoId(objectView.vedio??"")!,

      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:AppColors.kPrimaryColor ,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,),
      body:controller.isFullScreen? YoutubePlayer(

          progressIndicatorColor:AppColors.kGoldenColor ,
          progressColors: const ProgressBarColors(

            handleColor: AppColors.kGoldenColor,
            backgroundColor: AppColors.kPrimaryColor,playedColor: AppColors.kGoldenColor,
          ),
          controller: _controller):Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
        child: ListView(children: [
          CustomTextMuslim(text: objectView.title??"",istitle: true,),
         const SizedBox(height: 15,),
         objectView.vedio==null?Container(): ClipRRect(borderRadius: BorderRadius.circular(15),
            child: YoutubePlayer(
         showVideoProgressIndicator: true,
                progressIndicatorColor:AppColors.kGoldenColor ,
              progressColors: ProgressBarColors(

                handleColor: AppColors.kGoldenColor,
              backgroundColor: AppColors.kPrimaryColor,playedColor: AppColors.kGoldenColor,
              ),
              controller: _controller),
          ),
          const SizedBox(height: 15,),
          CustomTextMuslim(text: objectView.body??"",istitle: false,)
        ],),
      ),);
  }
  String? extractVideoId(String videoLink) {
  RegExp regExp = RegExp(
      r"(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})");
  RegExpMatch? match = regExp.firstMatch(videoLink);
  if (match != null) {
    return match.group(1);
  } else {
    return "Invalid YouTube link";
  }
}


}
