import 'package:app_car/app/modules/login/presenter/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class UrlVideo {
  String urlVideo;
  UrlVideo({@required this.urlVideo});
}

class VideoPlayPage extends StatefulWidget {
  final UrlVideo urlVideo;
  const VideoPlayPage({Key key, @required this.urlVideo}) : super(key: key);

  @override
  _VideoPlayPageState createState() => _VideoPlayPageState();
}

VideoPlayerController _controller;
bool playerVideo = true;

class _VideoPlayPageState extends State<VideoPlayPage> {
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.urlVideo.urlVideo);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(50),
        ),
        child: IconButton(
            onPressed: () {
              setState(() {
                playerVideo = !playerVideo;
              });
              playerVideo ? _controller.play() : _controller.pause();
            },
            icon: Icon(playerVideo ? Icons.play_arrow : Icons.pause,
                color: Colors.white)),
      ),
      body: GestureDetector(
        onTap: () {
          print('object');
          setState(() {
            playerVideo = !playerVideo;
          });
          playerVideo ? _controller.pause() : _controller.play();
        },
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
