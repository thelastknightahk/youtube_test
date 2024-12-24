import 'package:flutter/material.dart';
import 'package:youtube_test/external/youtube_player_flutter/packages/youtube_player_flutter/lib/youtube_player_flutter.dart';
 

class YoutubeItemWidget extends StatefulWidget {
  final String? youtubeID;
  const YoutubeItemWidget({super.key, this.youtubeID});

  @override
  State<YoutubeItemWidget> createState() => _YoutubeItemWidgetState();
}

class _YoutubeItemWidgetState extends State<YoutubeItemWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
    initialVideoId: widget.youtubeID ?? "",
    flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
    ),
);
 

    _controller.load(  widget.youtubeID?? "");
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      aspectRatio: 16 / 9,
      
    );
  }
}
