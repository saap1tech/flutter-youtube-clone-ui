// To parse this JSON data, do
//
//     final videos = videosFromJson(jsonString);

import 'dart:convert';

List<Videos> videosFromJson(String str) =>
    List<Videos>.from(json.decode(str).map((x) => Videos.fromJson(x)));

String videosToJson(List<Videos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Videos {
  Videos({
    this.id,
    this.title = "",
    this.desc,
    this.channelName,
    this.channelAvatar,
    this.image,
    this.video,
    this.views,
    this.time,
  });

  int? id;
  String title;
  String? desc;
  String? channelName;
  String? channelAvatar;
  String? image;
  String? video;
  int? views;
  DateTime? time;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        id: json["id"],
        title: json["title"],
        desc: json["desc"],
        channelName: json["channel_name"],
        channelAvatar: json["channel_avatar"],
        image: json["image"],
        video: json["video"],
        views: json["views"],
        time: DateTime.parse(json["time"]),
      );

  static List<Videos> videosFromSnapshot(List snapshot) {
    return snapshot.map((data) => Videos.fromJson(data)).toList();
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "desc": desc,
        "channel_name": channelName,
        "channel_avatar": channelAvatar,
        "image": image,
        "video": video,
        "views": views,
        "time": time.toString(),
      };
}
