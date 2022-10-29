import 'dart:convert';
import 'dart:io';

import 'package:esports_news/constants.dart';

import 'package:esports_news/model/info_model.dart';
import 'package:http/http.dart' as http;

import 'package:path_provider/path_provider.dart';

class ValorantApi {
  Constants constants = Constants();

  Future<List<ApiModelRecentSearch>> getAllData() async {
    // var slug = searchTerm;
    String url =
        'https://api.twitter.com/2/tweets/search/recent?query=valorant lang:en -is:retweet  &max_results=100&tweet.fields=conversation_id,created_at,id,possibly_sensitive,public_metrics,reply_settings,text,withheld&expansions=author_id,referenced_tweets.id&user.fields=profile_image_url';

    String fileName = 'user.josn';

    var dir = await getTemporaryDirectory();

    File file = File('${dir.path}/$fileName');

    int lastFetchTime = 12;
    int currentTime = DateTime.now().hour;
    print(currentTime - lastFetchTime);

    if ((currentTime - lastFetchTime) > 12) {
      Uri uri = Uri.parse(url);

      final response = await http.get(
        uri,
        headers: {
          "Authorization": constants.bearerToken,
          "User-Agent": "v2UserLookupJS",
        },
      );
      try {
        if (response.statusCode == 200) {
          print('loading from API');
          print(response.statusCode);
          final resp = '[${response.body}]';
          print(resp);
          // Map services = jsonDecode(resp);
          List service = (jsonDecode(resp) as List<dynamic>);
          file.writeAsStringSync(resp, flush: true, mode: FileMode.write);

          // return ApiModelRecentSearch.fromJson(jsonDecode(resp));
          var serviceBase = service
              .map((json) => ApiModelRecentSearch.fromJson(json))
              .toList();

          // await Hive.box(boxName).add(service);
          // await Hive.box(boxName).get(service);

          return serviceBase;
        }
      } catch (e) {
        print('problem: ${e.toString()}');
      }
      // var myMap = Hive.box(boxName).toMap().values.toList();
      // if (myMap.isEmpty) {
      //   data.add('empty');
      // } else {
      //   data = myMap;
      // }

      // return Future.value(true);
      return throw Exception('${response.statusCode}');
    } else if (file.existsSync()) {
      print('loading from CACHE');
      var jsonData = file.readAsStringSync();
      List responseVal = (jsonDecode(jsonData) as List<dynamic>);
      var serviceVal = responseVal
          .map((json) => ApiModelRecentSearch.fromJson(json))
          .toList();
      return serviceVal;
    } else {
      return throw Exception('null');
    }
  }
}
