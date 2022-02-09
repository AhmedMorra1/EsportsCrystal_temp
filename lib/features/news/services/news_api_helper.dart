import 'package:dio/dio.dart';
import 'package:webfeed/webfeed.dart';

/// API Helper class
class NewsAPIHelper {
  NewsAPIHelper({required this.dio});
  // dio object
  final Dio dio;

  Future<RssFeed> loadFeed({required String feedLink}) async {
    try{
      final response = await dio.get(feedLink);
      return RssFeed.parse(response.toString());
    }catch (e){
      return RssFeed();
    }
  }

}