import 'package:flutter/material.dart';
import 'package:youtube_clone/video_player.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF212121),
        appBar: AppBar(
          title: Text('Video page'),
        ),
        body: Column(
          children: <Widget>[
            VideoPlay(),
            Expanded(
                child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) => (Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                child: InkWell(
                  child: Row(
                    children: [
                      Image.network(
                        'https://i.ytimg.com/vi/8WaTd3z8sHE/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLC8FVdUKj5iRN4huWkj1kpHT97YQw',
                        width: 150,
                      ),
                      Text(
                        'title',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )),
            ))
          ],
        ));
  }
}
