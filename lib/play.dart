import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Play extends StatefulWidget {
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {

  String videoURL1 = "https://www.youtube.com/watch?v=TcMBFSGVi1c";
  String videoURL2 = "https://www.youtube.com/watch?v=ybji16u608U";
  String videoURL3 ="https://www.youtube.com/watch?v=fKopy74weus";

  YoutubePlayerController _controller1;
  YoutubePlayerController _controller2;
  YoutubePlayerController _controller3;

  @override
  void initState() {
    
    _controller1 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL1)
    );
    _controller2 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL2)
    );
    _controller3 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL3)
    );

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Youtube Player"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              YoutubePlayer(
                controller: _controller1,
                showVideoProgressIndicator: true,
              ),
              
              SizedBox(height:10),
              YoutubePlayer(
                controller: _controller2,
                showVideoProgressIndicator: true,
              ),
              SizedBox(height:10),
              YoutubePlayer(
                controller: _controller3,
                showVideoProgressIndicator: true,
              ),

            ],
          ),
        ),
      ),
    );
  }
}