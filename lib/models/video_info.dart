class VideoInfo {
  int index = 0;

  String getVideoTitle(String videoTitle) {
    index = 0;
    if (videoTitle.length > 29) {
      // fix title
      List<String> wordList = videoTitle.split(" ");
      String newTitle = "";
      while (index != wordList.length) {
        newTitle += makeTitleRow(wordList);
        if (wordList.length != index) {
          newTitle += "\n";
        }
      }
      return newTitle;
    } else {
      return videoTitle;
    }
  }

  String makeTitleRow(List<String> wordList) {
    String newTitleRow = wordList[index];
    index += 1;
    while (newTitleRow.length < 29 && index != wordList.length) {
      newTitleRow += " " + wordList[index];
      index += 1;
    }
    if (newTitleRow.length > 29) {
      List<String> res = newTitleRow.split(" ");
      res.removeLast();
      for (int i = 0; i < res.length; i++) {
        if (i == 0) {
          newTitleRow = res[i];
        } else {
          newTitleRow += " " + res[i];
        }
      }
      index -= 1;
    }
    return newTitleRow;
  }

  String getTime(String time) {
    var date_input_year = DateTime.parse(time).year;
    var date_input_month = DateTime.parse(time).month;
    var date_input_day = DateTime.parse(time).day;

    var date_now_year = DateTime.now().year;
    var date_now_month = DateTime.now().month;
    var date_now_day = DateTime.now().day;

    var result_year = date_now_year - date_input_year;
    var result_month = date_now_month - date_input_month;
    var result_day = date_now_day - date_input_day;

    String? respone;

    if (result_year > 0) {
      respone = '$result_year years ago';
    } else if (result_month > 0) {
      respone = '$result_month months ago';
    } else {
      respone = '$result_day days ago';
    }

    return respone;
  }
}
