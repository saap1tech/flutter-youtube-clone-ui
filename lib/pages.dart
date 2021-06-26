import 'dart:async';
import 'package:flutter/material.dart';
import 'package:youtube_clone/models/api.dart';
import 'package:youtube_clone/models/video_info.dart';
import 'package:youtube_clone/models/videos_list.dart';
import 'package:youtube_clone/video_page.dart';

class Pages extends StatefulWidget {
  Pages({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  List<Videos> _data = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();

    getData();
    //Timer.periodic(Duration(seconds: 2), (Timer t) => getData());
  }

  Future<void> getData() async {
    _data = await API().getVideos();
    setState(() {
      loading = false;
    });
  }

  void press() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => VideoPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/YouTube_full-color_icon_%282017%29.svg/1280px-YouTube_full-color_icon_%282017%29.svg.png',
              width: 40,
            ),
            Text(widget.title)
          ],
        ),
      ),
      body: loading
          ? Text('')
          : ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.only(top: 10),
                    /*clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),*/
                    child: InkWell(
                        onTap: () => press(),
                        child: Column(children: [
                          Container(
                            child: Image.network(
                              'http://localhost:8000/media/${_data[index].image}/',
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 10, top: 10, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: 35,
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Image.network(
                                          'http://localhost:8000/media/${_data[index].channelAvatar}/',
                                        ),
                                      ),
                                    ),
                                    Container()
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        VideoInfo()
                                            .getVideoTitle(_data[index].title),
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 20,
                                            fontFamily: "Helvetica",
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 7),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              "${_data[index].channelName}",
                                              style: TextStyle(
                                                  color: Colors.white38,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              " ∙ ",
                                              style: TextStyle(
                                                  color: Colors.white38,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              "${_data[index].views} views",
                                              style: TextStyle(
                                                  color: Colors.white38,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              " ∙ ",
                                              style: TextStyle(
                                                  color: Colors.white38,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              VideoInfo().getTime(
                                                  _data[index].time.toString()),
                                              style: TextStyle(
                                                  color: Colors.white24,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ])));
              }),
    );
  }
}
