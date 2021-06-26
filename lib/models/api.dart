import 'dart:convert';

import 'package:youtube_clone/models/videos_list.dart';
import 'package:http/http.dart' as http;

class API {
  Future<List<Videos>> getVideos() async {
    var url = Uri.parse('http://localhost:8000/get_all/');

    final response = await http.get(url);

    var data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data) {
      _temp.add(i);
    }

    //print('data is ${Videos.videosFromSnapshot(_temp)}');
    //print('_temp is $_temp');

    return Videos.videosFromSnapshot(_temp);
  }
}
