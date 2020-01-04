import 'package:http/http.dart' as http;

Future<http.Response> getLikes() {
  return http.get(
      'https://api-v2.soundcloud.com/users/242833986/track_likes?client_id=YUKXoArFcqrlQn9tfNHvvyfnDISj04zk&limit=20');
}

Future<http.Response> getWordList() {
  return http.get(
      'https://api.lingvolive.com/Translation/WordListPart?prefix=lau&srcLang=32775&dstLang=1049&pageSize=10&startIndex=0');
}
