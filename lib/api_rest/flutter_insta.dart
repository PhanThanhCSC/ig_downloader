import 'dart:convert';

import 'package:base_project_getx/core/model/base_model/reel_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../core/model/base_model/profile_user_model.dart'; // import http package for API calls

class InfoPost {
  String? nameUser;
  String? idUser;
  String? idPost;
  String? pathRequest;

  InfoPost(this.nameUser, this.idUser, this.idPost, this.pathRequest);
}

class InfoUser {
  String? nameUser;
  String? idUser;
  String? profilePic;

  InfoUser(this.nameUser, this.idUser, this.profilePic);
}

class FlutterInstaAPI {
  // https://www.instagram.com/stories/leagueofvide0/3188696969144298949/
  // https://www.instagram.com/p/CxCtFmYtYH3/ (post)
  // https://www.instagram.com/reel/CxCsZIPNfgz/ (reel)
  // https://www.instagram.com/p/Cw8gSAyhAPr/?img_index=1
  // https://www.instagram.com/1989ivyshao/reels/ (reels)

  final String baseQuery = "https://www.instagram.com/graphql/query/?query_hash=b3055c01b4b222b8a47dc12b090e4e64&variables=";
  final String urlBase = "https://www.instagram.com/";
  final String story = "api/v1/feed/reels_media/";
  final String endPath = "?__a=1&__d=dis";
  InfoPost? current;

  Map<String, String> headersDefault = {
    "X-csrftoken": "1",
    'Accept': '*/*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'en-US,en;q=0.9',
    'X-Requested-With': 'XMLHttpRequest',
    'User-Agent':
        'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36',
    "Cookie": "csrftoken=1"
  };

  //Download reels video
  Future<ReelModel?> downloadReels(String link) async {
    InfoPost infoReel = await getInfoVideo(link);

    if (infoReel.pathRequest == null) {
      return null;
    }

    var reelRp = await http.get(Uri.parse(infoReel.pathRequest!));
    var data = json.decode(reelRp.body);
    if (reelRp.statusCode == 401) {
      print('====> load fail');
    } else {
      print('====> 1 ${data} -- ${reelRp.statusCode}');
      var reel = ReelModel.fromJson(json.decode(reelRp.body));
      print('====>${reel.graphql?.shortcodeMedia?.typename}');
      return reel;
    }

  }

  //get profile details
  Future<ProfileUserModel?> getProfileData(String username) async {
    var res = await http
        .get(Uri.parse(Uri.encodeFull(username + "?__a=1&__d=dis")));
    var data = json.decode(res.body);
    print('====> 1 ${data} -- ${res.statusCode}');
    var profile = ProfileUserModel.fromJson(json.decode(res.body));
    return profile;
  }

  Future<void> downloadStory(String input) async {
    var res = await http.get(
      Uri.parse(input),
      headers: {},
    );
    var data = json.decode(res.body);
    var reels = data['reels'];
    // var user = reels[idUser];
    // var videos = user['items'].map<String>((item) => item['video_versions']['url'] as String);
  }

  Future<void> downloadPost(String input) async {
    var res = await http.get(
      Uri.parse(Uri.encodeFull(input ?? '')),
      headers: {},
    );
    var data = json.decode(res.body);
    var reels = data['reels'];
    // var user = reels[idUser];
    // var videos = user['items'].map<String>((item) => item['video_versions']['url'] as String);
  }

  String getPath(String name) {
    if (name.compareTo(urlBase) == true) {
      return name + "?__a=1&__d=dis";
    } else {
      return urlBase + "/" + name + "/?__a=1&__d=dis";
    }
  }

  String headerDefault() {
    return "";
  }

  Future<InfoPost> getInfoVideo(String input) async {
    String? idPost;
    String? userName;
    String? idUser;
    String? path;
    // https://www.instagram.com/graphql/query/?query_hash=b3055c01b4b222b8a47dc12b090e4e64&variables={"shortcode":"CtO-WItvI4d"}
    if (input.contains("instagram.com")) {
      List<String> infoContent = input.split("/");
      if (infoContent.contains("reels")) {
        path = input + endPath;
        userName = infoContent[infoContent.length - 1];
      } else if (infoContent.contains("reel")) {
        path = input + endPath;
        idPost = infoContent.last;
      } else if (infoContent.contains("feed")) {
        path = input + endPath;
        idPost = infoContent.last;
      } else if (infoContent.contains("tagged")) {
        path = input + endPath;
        userName = infoContent[infoContent.length - 1];
      } else if (infoContent.contains("stories")) {
        InfoUser infoUser = await requestBaseProfile(input);
        path = input;
        idPost = infoContent.last;
        idUser = infoUser.idUser;
        userName = infoUser.nameUser;
      } else {
        path = input + endPath;
        idPost = infoContent.last;
      }
      return InfoPost(userName, idUser, idPost, path);
    } else {
      idPost = input;
      path = urlBase + 'p/' + input + "/" + endPath;
      return InfoPost(userName, idUser, idPost, path);
    }
  }

  // input = https://www.instagram.com/{nameuser}/ or {nameuser}
  Future<void> getInfoUser(String input) async {
    String? idUser;
    String? profilePic;
    String? userName;
    if (input.contains("instagram.com")) {
      requestProfile(input);
    } else {
      String path = urlBase + input + "/" + endPath;
      requestProfile(path);
    }
  }

  Future<InfoUser> requestBaseProfile(String path) async {
    var res = await http.get(
      Uri.parse(Uri.encodeFull(path)),
      headers: {},
    );
    var data = json.decode(res.body);
    var user = data['user'];
    String idUser = user['id'];
    String profilePic = user['profile_pic_url'];
    String userName = user['username'];
    return InfoUser(userName, idUser, profilePic);
  }

  Future<void> requestProfile(String path) async {
    var res = await http.get(
      Uri.parse(Uri.encodeFull(path)),
      headers: {},
    );
    var data = json.decode(res.body);
    var graphql = data['graphql'];
    var user = graphql['user'];
    String idUser = user['id'];
    String biography = user['biography'];
    String profileThumb = user['profile_pic_url'];
    String profilePichd = user['profile_pic_url_hd'];
    String userName = user['username'];
    String fullName = user['full_name'];
    print(
        '=====>>>thanh: ${idUser} --${biography} --${profileThumb} --${userName} --${fullName} --');
  }
}
