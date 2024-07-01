import 'package:united_mania_flutter/utils/app_assets.dart';
import 'package:united_mania_flutter/utils/map_keys.dart';

class ApiResponseBody {
  static const String API_URL =
      "https://newsapi.org/v2/everything?q=manchester%20united%7Cman%20utd%7Cman%20united%7Cmanchester%20utd&apiKey=47ba773d0f1147438a3d6244bc7f1e5e&sortBy=publishedAt&language=en&fbclid=IwAR215STnwzrUekxittTkbK3Vn8INjsOE0Zl28uctn2lDwpOelkKVurJvWwc";
  final String status;
  final int totalResults;
  final List<Article> articles;

  const ApiResponseBody(this.status, this.totalResults, this.articles);

  factory ApiResponseBody.fromJson(Map<String, dynamic> json) {
    return ApiResponseBody(json[MapKeys.status], json[MapKeys.totalResults],
        List<Article>.from(json[MapKeys.articles].map((x) => Article.fromJson(x))));
  }
}

class Article {
  final Source source;
  final String title;
  final String content;
  final String url;
  final String image;

  const Article(this.source, this.title, this.content, this.url, this.image);

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        Source.fromJson(json[MapKeys.source]),
        json[MapKeys.title],
        json[MapKeys.content],
        json[MapKeys.url],
        json[MapKeys.urlToImage] ?? AppAssets.placeholder);
  }
}

class Source {
  final String name;

  const Source(this.name);

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(json[MapKeys.name]);
  }
}
