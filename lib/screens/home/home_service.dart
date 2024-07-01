import 'dart:convert';
import 'package:http/http.dart';
import 'package:united_mania_flutter/models/data.dart';

class HomeService{

  Future<List<Article>> fetchArticles(int pageSize, int page) async{
    dynamic response = await get(Uri.parse(
        ApiResponseBody.API_URL + "&pageSize=$pageSize" + "&page=$page"));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonParsed = json.decode(response.body);
      ApiResponseBody responseBody = ApiResponseBody.fromJson(jsonParsed);
      return responseBody.articles;
    } else
      throw Exception('Failed to load data!');
  }
}